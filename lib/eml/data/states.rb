# typed: strong
# frozen_string_literal: true

# rubocop:disable Metrics/ModuleLength
# rubocop:disable Style/AsciiComments
module EML
  STATES = T.let(
    [
      # Afghanistan
      "BDS", # Badakhshān
      "BDG", # Bādghīs
      "BGL", # Baghlān
      "BAL", # Balkh
      "BAM", # Bāmīān
      "FRA", # Farāh
      "FYB", # Fāryāb
      "GHA", # Ghaznī
      "GHO", # Ghowr
      "HEL", # Helmand
      "HER", # Herāt
      "JOW", # Jowzjān
      "KAB", # Kabul (Kābol)
      "KAN", # Kandahār
      "KAP", # Kāpīsā
      "KNR", # Konar (Kunar)
      "KDZ", # Kondoz (Kunduz)
      "LAG", # Laghmān
      "LOW", # Lowgar
      "NAN", # Nangrahār (Nangarhār)
      "NIM", # Nīmrūz
      "ORU", # Orūzgān (Urūzgā
      "PIA", # Paktīā
      "PKA", # Paktīkā
      "PAR", # Parwān
      "SAM", # Samangān
      "SAR", # Sar-e Pol
      "TAK", # Takhār
      "WAR", # Wardak (Wardag)
      "ZAB", # Zābol (Zābul)
      # Albania
      "BR", # Berat
      "BU", # Bulqizë
      "DL", # Delvinë
      "DV", # Devoll
      "DI", # Dibër
      "DR", # Durrës
      "EL", # Elbasan
      "FR", # Fier
      "GR", # Gramsh
      "GJ", # Gjirokastër
      "HA", # Has
      "KA", # Kavajë
      "ER", # Kolonjë
      "KO", # Korcë
      "KR", # Krujë
      "KC", # Kucovë
      "KU", # Kukës
      "LA", # Laç
      "LE", # Lezhë
      "LB", # Librazhd
      "LU", # Lushnjë
      "MM", # Malësia e Madhe
      "MK", # Mallakastër
      "MT", # Mat
      "MR", # Mirditë
      "PQ", # Peqin
      "PR", # Përmet
      "PG", # Pogradec
      "PU", # Pukë
      "SR", # Sarandë
      "SK", # Skrapar
      "SH", # Shkodër
      "TE", # Tepelenë
      "TR", # Tiranë
      "TP", # Tropojë
      "VL", # Vlorë
      # Algeria
      "01", # Adrar
      "44", # Aïn Defla
      "46", # Aïn Témouchent
      "16", # Alger
      "05", # Batna
      "08", # Béchar
      "06", # Béjaïa
      "07", # Biskra
      "09", # Blida
      "34", # Bordj Bou Arréridj
      "10", # Bouira
      "35", # Boumerdès
      "02", # Chlef
      "25", # Constantine
      "17", # Djelfa
      "32", # El Bayadh
      "39", # El Oued
      "36", # El Tarf
      "47", # Ghardaïa
      "24", # Guelma
      "33", # Illizi
      "18", # Jijel
      "40", # Khenchela
      "03", # Laghouat
      "29", # Mascara
      "26", # Médéa
      "43", # Mila
      "27", # Mostaganem
      "28", # Msila
      "45", # Naama
      "31", # Oran
      "30", # Ouargla
      "04", # Oum el Bouaghi
      "48", # Relizane
      "20", # Saïda
      "19", # Sétif
      "22", # Sidi Bel Abbès
      "21", # Skikda
      "41", # Souk Ahras
      "11", # Tamanghasset
      "12", # Tébessa
      "14", # Tiaret
      "37", # Tindouf
      "42", # Tipaza
      "38", # Tissemsilt
      "15", # Tizi Ouzou
      "13", # Tlemcen
      # American Samoa
      "AS", # American Samoa
      # Andorra
      "AD", # Andorra
      # Angola
      "BGO", # Bengo
      "BGU", # Benguela
      "BIE", # Bié
      "CAB", # Cabinda
      "CCU", # Cuando-Cubango
      "CNO", # Cuanza Norte
      "CUS", # Cuanza Sul
      "CNN", # Cunene
      "HUA", # Huambo
      "HUI", # Huíla
      "LUA", # Luanda
      "LNO", # Lunda Norte
      "LSU", # Lunda Sul
      "MAL", # Malange
      "MOX", # Moxico
      "NAM", # Namibe
      "UIG", # Uíge
      "ZAI", # Zaïre
      # Anguilla
      "AI", # Anguilla
      # Antarctica
      "AQ", # Antarctica
      # Antigua & Barbuda
      "AG", # Antigua & Barbuda
      # Argentina
      "C", # Capital federal
      "B", # Buenos Aires
      "K", # Catamarca
      "X", # Córdoba
      "W", # Corrientes
      "H", # Chaco
      "U", # Chubut
      "E", # Entre Ríos
      "P", # Formosa
      "Y", # Jujuy
      "L", # La Pampa
      "F", # La Rioja
      "M", # Mendoza
      "N", # Misiones
      "Q", # Neuquén
      "R", # Río Negro
      "A", # Salta
      "J", # San Juan
      "D", # San Luis
      "Z", # Santa Cruz
      "S", # Santa Fe
      "G", # Santiago del Estero
      "V", # Tierra del Fuego
      "T", # Tucumán
      # Armenia
      "ER", # Erevan
      "AG", # Aragacotn
      "AR", # Ararat
      "AV", # Armavir
      "GR", # Geģark'unik'
      "KT", # Kotayk'
      "LO", # Loŕy
      "SH", # Širak
      "SU", # Syunik'
      "TV", # Tavuš
      "VD", # Vayoc Jor
      # Aruba
      "AW", # Aruba
      # Australia
      "NSW", # New South Wales
      "QLD", # Queensland
      "SA", # South Australia
      "TAS", # Tasmania
      "VIC", # Victoria
      "WA", # Western Australia
      "ACT", # Australian Capital Territory
      "NT", # Northern Territory
      # Austria
      "1", # Burgenland
      "2", # Kärnten
      "3", # Niederösterreich
      "4", # Oberösterreich
      "5", # Salzburg
      "6", # Steiermark
      "7", # Tirol
      "8", # Vorarlberg
      "9", # Wien
      # Azerbaijan
      "MM", # Naxçivan
      "AB", # Äli Bayramli
      "BA", # Baki
      "GA", # Gäncä
      "LA", # Länkäran
      "MI", # Mingäçevir
      "NA", # Naftalan
      "SA", # Şäki
      "SM", # Sumqayit
      "SS", # Şuşa
      "XA", # Xankändi
      "YE", # Yevlax
      "ABS", # Abşeron
      "AGC", # Ağcabädi
      "AGM", # Ağdam
      "AGS", # Ağdas
      "AGA", # Ağstafa
      "AGU", # Ağsu
      "AST", # Astara
      "BAB", # Babäk
      "BAL", # Balakän
      "BAR", # Bärdä
      "BEY", # Beyläqan
      "BIL", # Biläsuvar
      "CAB", # Cäbrayil
      "CAL", # Cälilabad
      "CUL", # Culfa
      "DAS", # Daşkäsän
      "DAV", # Däväçi
      "FUZ", # Füzuli
      "GAD", # Gädäbäy
      "GOR", # Goranboy
      "GOY", # Göyçay
      "HAC", # Haciqabul
      "IMI", # Imişli
      "ISM", # Ismayilli
      "KAL", # Kälbäcär
      "KUR", # Kürdämir
      "LAC", # Laçin
      "LAN", # Länkäran
      "LER", # Lerik
      "MAS", # Masalli
      "NEF", # Neftçala
      "OGU", # Oğuz
      "ORD", # Ordubad
      "QAB", # Qäbälä
      "QAX", # Qax
      "QAZ", # Qazax
      "QOB", # Qobustan
      "QBA", # Quba
      "QBI", # Qubadlı
      "QUS", # Qusar
      "SAT", # Saatli
      "SAB", # Sabirabad
      "SAD", # Sädäräk
      "SAH", # Şahbuz
      "SAK", # Şäki
      "SAL", # Salyan
      "SMI", # Şamaxı
      "SKR", # Şämkir
      "SMX", # Samux
      "SAR", # Şärur
      "SIY", # Siyäzän
      "SUS", # Şuşa
      "TAR", # Tärtär
      "TOV", # Tovuz
      "UCA", # Ucar
      "XAC", # Xaçmaz
      "XAN", # Xanlar
      "XIZ", # Xizi
      "XCI", # Xocalı
      "XVD", # Xocavänd
      "YAR", # Yardimli
      "YEV", # Yevlax
      "ZAN", # Zängılan
      "ZAQ", # Zaqatala
      "ZAR", # Zärdab
      # Bahamas
      "AC", # Acklins and Crooked Islands
      "BI", # Bimini
      "CI", # Cat Island
      "EX", # Exuma
      "FP", # Freeport
      "FC", # Fresh Creek
      "GH", # Governor's Harbour
      "GT", # Green Turtle Cay
      "HI", # Harbour Island
      "HR", # High Rock
      "IN", # Inagua
      "KB", # Kemps Bay
      "LI", # Long Island
      "MH", # Marsh Harbour
      "MG", # Mayaguana
      "NP", # New Providence
      "NB", # Nicholls Town and Berry Islands
      "RI", # Ragged Island
      "RS", # Rock Sound
      "SP", # Sandy Point
      "SR", # San Salvador and Rum Cay
      # Bahrain
      "01", # Al Ḩadd
      "03", # Al Manāmah
      "10", # Al Minţaqah al Gharbīyah
      "07", # Al Minţaqah al Wusţa
      "05", # Al Minţaqah ash Shamālīyah
      "02", # Al Muḩarraq
      "09", # Ar Rifā‘
      "04", # Jidd Ḩafş
      "12", # Madīnat Ḩamad
      "08", # Madīnat ‘Īsá
      "11", # Minţaqat Juzur Ḩawār
      "06", # Sitrah
      # Bangladesh
      "1", # Barisal bibhag
      "1B", # Barisal anchal
      "1Q", # Patuakhali anchal
      "2", # Chittagong bibhag
      "2A", # Bandarban anchal
      "2D", # Chittagong anchal
      "2E", # Chittagong Hill Tracts
      "2F", # Comilla anchal
      "2O", # Noakhali anchal
      "2T", # Sylhet anchal
      "3", # Dhaka bibhag
      "3G", # Dhaka anchal
      "3I", # Faridpur anchal
      "3J", # Jamalpur anchal
      "3N", # Mymensingh anchal
      "3U", # Tangail anchal
      "4", # Khulna bibhag
      "4K", # Jessore anchal
      "4L", # Khulna anchal
      "4M", # Khustia anchal
      "5", # Rajshahi bibhag
      "5C", # Bogra anchal
      "5H", # Dinajpur anchal
      "5P", # Pabna anchal
      "5R", # Rajshahi anchal
      "5S", # Rangpur anchal
      # Barbados
      "BB", # Barbados
      # Belarus
      "BR", # Brestskaya voblasts'
      "HO", # Homyel'skaya voblasts’
      "HR", # Hrodnenskaya voblasts'
      "MA", # Mahilyowskaya voblasts'
      "MI", # Minskaya voblasts'
      "VI", # Vitsyebskaya voblasts'
      # Belgium
      # Bruxelles-Capitale, Region de (fr), Brussels Hoofdstedelijk Gewest (nl)
      "BRU",
      "VLG", # Vlaamse Gewest (nl)
      "VAN", # Antwerpen (nl)
      "VLI", # Limburg (nl)
      "VOV", # Oost-Vlaanderen (nl)
      "VBR", # Vlaams Brabant (nl)
      "VWV", # West-Vlaanderen (nl)
      "WAL", # Wallonne, Region (fr)
      "WBR", # Brabant Wallon (fr)
      "WHT", # Hainaut (fr)
      "WLG", # Liège (fr)
      "WLX", # Luxembourg (fr)
      "WNA", # Namur (fr)
      # Belize
      "BZ", # Belize
      "CY", # Cayo
      "CZL", # Corozal
      "OW", # Orange Walk
      "SC", # Stann Creek
      "TOL", # Toledo
      # Benin
      "AK", # Atakora
      "AQ", # Atlantique
      "BO", # Borgou
      "MO", # Mono
      "OU", # Ouémé
      "ZO", # Zou
      # Bermuda
      "BM", # Bermuda
      # Bhutan
      "33", # Bumthang
      "12", # Chhukha
      "22", # Dagana
      "GA", # Gasa
      "13", # Ha
      "44", # Lhuentse
      "42", # Monggar
      "11", # Paro
      "43", # Pemagatshel
      "23", # Punakha
      "45", # Samdrup Jongkha
      "14", # Samtse
      "31", # Sarpang
      "15", # Thimphu
      "41", # Trashigang
      "TY", # Trashi Yangtse
      "32", # Trongsa
      "21", # Tsirang
      "24", # Wangdue Phodrang
      "34", # Zhemgang
      # Bolivia
      "C", # Cochabamba
      "H", # Chuquisaca
      "B", # El Beni
      "L", # La Paz
      "O", # Oruro
      "N", # Pando
      "P", # Potosi
      "S", # Santa Cruz
      "T", # Tarija
      # Bosnia & Herzegovina
      "BIH", # Federacija Bosna i Hercegovina
      "SRP", # Republika Srpska
      # Botswana
      "CE", # Central [Serowe-Palapye]
      "CH", # Chobe
      "GH", # Ghanzi
      "KG", # Kgalagadi
      "KL", # Kgatleng
      "KW", # Kweneng
      "NG", # Ngamiland [North-West]
      "NE", # North-East
      "SE", # South-East
      "SO", # Southern [Ngwaketse]
      # Bouvet Island
      "BV", # Bouvet Island
      # Brazil
      "DF", # Distrito Federal
      "AC", # Acre
      "AL", # Alagoas
      "AP", # Amapá
      "AM", # Amazonas
      "BA", # Bahia
      "CE", # Ceará
      "ES", # Espírito Santo
      "GO", # Goiás
      "MA", # Maranhāo
      "MT", # Mato Grosso
      "MS", # Mato Grosso do Sul
      "MG", # Minas Gerais
      "PA", # Pará
      "PB", # Paraíba
      "PR", # Paraná
      "PE", # Pernambuco
      "PI", # Piauí
      "RJ", # Rio de Janeiro
      "RN", # Rio Grande do Norte
      "RS", # Rio Grande do Sul
      "R0", # Rondônia
      "RR", # Roraima
      "SC", # Santa Catarina
      "SP", # São Paulo
      "SE", # Sergipe
      "TO", # Tocantins
      # British Indian Ocean Territory
      "IO", # British Indian Ocean Territory
      # Brunei Darussalam
      "BE", # Belait
      "BM", # Brunei-Muara
      "TE", # Temburong
      "TU", # Tutong
      # Bulgaria
      "02", # Burgas
      "09", # Haskovo
      "04", # Loveč
      "05", # Montana
      "06", # Plovdiv
      "07", # Ruse
      "08", # Sofija
      "01", # Sofija-Grad
      "03", # Varna
      # Burkina Faso
      "BAL", # Balé
      "BAM", # Bam
      "BAN", # Banwa
      "BAZ", # Bazèga
      "BGR", # Bougouriba
      "BLG", # Boulgou
      "BLK", # Boulkiemdé
      "COM", # Comoé
      "GAN", # Ganzourgou
      "GNA", # Gnagna
      "GOU", # Gourma
      "HOU", # Houet
      "IOB", # Ioba
      "KAD", # Kadiogo
      "KEN", # Kénédougou
      "KMD", # Komondjari
      "KMP", # Kompienga
      "KOS", # Kossi
      "KOP", # Koulpélogo
      "KOT", # Kouritenga
      "KOW", # Kourwéogo
      "LER", # Léraba
      "LOR", # Loroum
      "MOU", # Mouhoun
      "NAO", # Nahouri
      "NAM", # Namentenga
      "NAY", # Nayala
      "NOU", # Noumbiel
      "OUB", # Oubritenga
      "OUD", # Oudalan
      "PAS", # Passoré
      "PON", # Poni
      "SNG", # Sanguié
      "SMT", # Sanmatenga
      "SEN", # Séno
      "SIS", # Sissili
      "SOM", # Soum
      "SOR", # Sourou
      "TAP", # Tapoa
      "TUI", # Tui
      "YAG", # Yagha
      "YAT", # Yatenga
      "ZIR", # Ziro
      "ZON", # Zondoma
      "ZOU", # Zoundwéogo
      # Burundi
      "BB", # Bubanza
      "BJ", # Bujumbura
      "BR", # Bururi
      "CA", # Cankuzo
      "CI", # Cibitoke
      "GI", # Gitega
      "KR", # Karuzi
      "KY", # Kayanza
      "KI", # Kirundo
      "MA", # Makamba
      "MU", # Muramvya
      "MY", # Muyinga
      "NG", # Ngozi
      "RT", # Rutana
      "RY", # Ruyigi
      # Cambodia
      "23", # Krong Kaeb [Krŏng Kêb]
      "18", # Krong Preah Sihanouk [Krŏng Preăh Sihanouk]
      "12", # Phnom Penh [Phnum Pénh]
      "2", # Baat Dambang [Bătdâmbâng]
      "1", # Banteay Mean Chey [Bântéay Méanchey]
      "3", # Kampong Chaam [Kâmpóng Cham]
      "4", # Kampong Chhnang [Kâmpóng Chhnăng]
      "5", # Kampong Spueu [Kâmpóng Spœ]
      "6", # Kampong Thum [Kâmpóng Thum]
      "7", # Kampot [Kâmpôt]
      "8", # Kandaal [Kândal]
      "10", # Kracheh [Krâchéh]
      "11", # Mond01 Kiri [Môndól Kiri]
      "22", # Otdar Mean Chey [Ŏtdâr Méanchey]
      "15", # Pousaat [Poŭthĭsăt]
      "13", # Preah Vihear [Preăh Vihéar]
      "14", # Prey Veaeng [Prey Vêng]
      "16", # Rotanak Kiri [Rôtânôkiri]
      "17", # Siem Reab [Siĕmréab]
      "19", # Stueng Traeng [Stœng Trêng]
      "20", # Svaay Rieng [Svay Riĕng]
      "21", # Taakaev [Takêv]
      # Cameroon
      "AD", # Adamaoua
      "CE", # Centre
      "ES", # Est
      "EN", # Far North
      "LT", # Littoral
      "NO", # North
      "NW", # North-West
      "SU", # South
      "SW", # South-West
      "OU", # West
      # Canada
      "AB", # Alberta
      "BC", # British Columbia (Colombie-Britannique)
      "MB", # Manitoba
      "NB", # New Brunswick (Nouveau-Brunswick)
      "NL", # Newfoundland and Labrador (Terre-Neuve)
      "NS", # Nova Scotia (Nouvelle-Écosse)
      "ON", # Ontario
      "PE", # Prince Edward Island (Île-du-Prince-Édouard)
      "QC", # Quebec (Québec)
      "SK", # Saskatchewan
      "NT", # Northwest Territories (Territoires du Nord-Ouest)
      "NU", # Nunavut
      "YT", # Yukon Territory (Teritoire du Yukon)
      # Cape Verde
      "B", # Ilhas de Barlavento
      "BV", # Boa Vista
      "PA", # Paul
      "PN", # Porto Novo
      "RG", # Ribeira Grande
      "SL", # Sal
      "SN", # Sāo Nicolau
      "SV", # Sāo Vicente
      "S", # Ilhas de Sotavento
      "BR", # Brava
      "FO", # Fogo
      "MA", # Maio
      "PR", # Praia
      "CA", # Santa Catarina
      "CR", # Santa Cruz
      "TA", # Tarrafal
      # Cayman Islands
      "KY", # Cayman Islands
      # Central African Republic
      "BGF", # Bangui
      "BB", # Bamingui-Bangoran
      "BK", # Basse-Kotto
      "HK", # Haute-Kotto
      "HM", # Haut-Mbomou
      "KG", # Kémo
      "LB", # Lobaye
      "HS", # Mambéré-Kadéï
      "MB", # Mbomou
      "KB", # Nana-Grébizi
      "NM", # Nana-Mambéré
      "MP", # Ombella-Mpoko
      "UK", # Ouaka
      "AC", # Ouham
      "OP", # Ouham-Pendé
      "SE", # Sangha-Mbaéré
      "VK", # Vakaga
      # Chad
      "BA", # Batha
      "BI", # Biltine
      "BET", # Borkou-Ennedi-Tibesti
      "CB", # Chari-Baguirmi
      "GR", # Guéra
      "KA", # Kanem
      "LC", # Lac
      "LO", # Logone-Occidental
      "LR", # Logone-Oriental
      "MK", # Mayo-Kébbi
      "MC", # Moyen-Chari
      "OD", # Ouaddaï
      "SA", # Salamat
      "TA", # Tandjilé
      # Chile
      "AI", # Aisén del General Carlos Ibáñiez del Campo
      "AN", # Antofagasta
      "AR", # Araucanía
      "AT", # Atacama
      "BI", # Bío-Bío
      "CO", # Coquimbo
      "LI", # Libertador General Bernardo O'Higgins
      "LL", # Los Lagos
      "MA", # Magallanes
      "ML", # Maule
      "RM", # Regíon Metropolitana de Santiago
      "TA", # Tarapacá
      "VS", # Valparaiso
      # China
      "11", # Beijing
      "50", # Chongqing
      "31", # Shanghai
      "12", # Tianjin
      "34", # Anhui
      "35", # Fujian
      "62", # Gansu
      "44", # Guangdong
      "52", # Guizhou
      "46", # Hainan
      "13", # Hebei
      "23", # Heilongjiang
      "41", # Henan
      "42", # Hubei
      "43", # Hunan
      "32", # Jiangsu
      "36", # Jiangxi
      "22", # Jilin
      "21", # Liaoning
      "63", # Qinghai
      "61", # Shaanxi
      "37", # Shandong
      "14", # Shanxi
      "51", # Sichuan
      "71", # Taiwan
      "53", # Yunnan
      "33", # Zhejiang
      "45", # Guangxi
      "15", # Nei Monggol
      "64", # Ningxia
      "65", # Xinjiang
      "54", # Xizang
      "91", # Hong Kong
      # Christmas Island
      "CX", # Christmas Island
      # Cocos (Keeling) Islands
      "CC", # Cocos (Keeling) Islands
      # Colombia
      "DC", # Distrito Capital de Santa Fe de Bogota
      "AMA", # Amazonas
      "ANT", # Antioguia
      "ARA", # Arauca
      "ATL", # Atlántico
      "BOL", # Bolívar
      "BOY", # Boyacá
      "CAL", # Caldas
      "CAQ", # Caquetá
      "CAS", # Casanare
      "CAU", # Cauca
      "CES", # Cesar
      "COR", # Córdoba
      "CUN", # Cundinamarca
      "CHO", # Chocó
      "GUA", # Guainía
      "GUV", # Guaviare
      "HUI", # Huila
      "LAG", # La Guajira
      "MAG", # Magdalena
      "MET", # Meta
      "NAR", # Nariño
      "NSA", # Norte de Santander
      "PUT", # Putumayo
      "QUI", # Quindío
      "RIS", # Risaralda
      "SAP", # San Andrés, Providencia y Santa Catalina
      "SAN", # Santander
      "SUC", # Sucre
      "TOL", # Tolima
      "VAC", # Valle del Cauca
      "VAU", # Vaupés
      "VID", # Vichada
      # Comoros
      "A", # Anjouan (Ndzouani)
      "G", # Grande Comore (Ngazidja)
      "M", # Mohéli (Moili)
      # Congo
      "BZV", # Brazzaville
      "11", # Bouenza
      "8", # Cuvette
      "15", # Cuvette-Ouest
      "5", # Kouilou
      "2", # Lékoumou
      "7", # Likouala
      "9", # Niari
      "14", # Plateaux
      "12", # Pool
      "13", # Sangha
      # Zaire
      "KN", # Kinshasa
      "BN", # Bandundu
      "BC", # Bas-Congo
      "EQ", # Équateur
      "HC", # Haut-Congo
      "KW", # Kasai-Occidental
      "KE", # Kasai-Oriental
      "KA", # Katanga
      "MA", # Maniema
      "NK", # Nord-Kivu
      "SK", # Sud-Kivu
      # Cook Islands
      "CK", # Cook Islands
      # Costa Rica
      "A", # Alajuela
      "C", # Cartago
      "G", # Guanacaste
      "H", # Heredia
      "L", # Limón
      "P", # Puntarenas
      "SJ", # San José
      # Cote D'ivoire (Ivory Coast)
      "06", # 18 Montagnes (Région des)
      "16", # Agnébi (Région de l')
      "09", # Bas-Sassandra (Région du)
      "10", # Denguélé (Région du)
      "02", # Haut-Sassandra (Région du)
      "07", # Lacs (Région des)
      "01", # Lagunes (Région des)
      "12", # Marahoué (Région de la)
      "05", # Moyen-Comoé (Région du)
      "11", # Nzi-Comoé (Région)
      "03", # Savanes (Région des)
      "15", # Sud-Bandama (Région du)
      "13", # Sud-Comoé (Région du)
      "04", # Vallée du Bandama (Région de la)
      "14", # Worodougou (Région du)
      "08", # Zanzan (Région du)
      # Croatia (Hrvatska)
      "07", # Bjelovarsko-bilogorska županija
      "12", # Brodsko-posavska županija
      "19", # Dubrovačko-neretvanska županija
      "18", # Istarska županija
      "04", # Karlovačka županija
      "06", # Koprivničkco-križevačka županija
      "02", # Krapinsko-zagorska županija
      "09", # Ličko-senjska županija
      "20", # Medjimurska županija
      "14", # Osječko-baranjska županija
      "11", # Požeško-slavonska županija
      "08", # Primorsko-goranska županija
      "03", # Sisaško-moslavačka županija
      "17", # Splitsko-dalmatinska županija
      "15", # Šibensko-kninska županija
      "05", # Varaždinska županija
      "10", # Virovitičko-podravska županija
      "16", # Vukovarsko-srijemska županija
      "13", # Zadarska županija
      "01", # Zagrebačka županija
      # Cuba
      "09", # Camagüey
      "03", # Ciudad de La Habana
      "12", # Granma
      "14", # Guantánamo
      "11", # Holguín
      "02", # La Habana
      "10", # Las Tunas
      "04", # Matanzas
      "01", # Pinar del Río
      "07", # Sancti Spíritus
      "13", # Santiago de Cuba
      "05", # Villa Clara
      "99", # Isla de la Juventud
      # Cyprus
      "04", # Ammochostos (Mağusa)
      "06", # Keryneia (Girne)
      "03", # Larnaka
      "01", # Lefkosia (Lefkoşa)
      "02", # Lemesos (Leymosun)
      "05", # Pafos (Baf)
      # Czech Republic
      "PRG", # Praha
      "CJC", # Jihočeský kraj
      "CJM", # Jihomoravský kraj
      "CSC", # Severočeský kraj
      "CSM", # Severomoravský kraj
      "CST", # Středočeský kraj
      "CVC", # Východočeský kraj
      "CZC", # Západočeský kraj
      # Denmark
      "147", # Frederiksberg
      "101", # Kǿbenhavn
      "040", # Bornholm
      "020", # Frederiksborg
      "042", # Fyn
      "015", # Kǿbenhavn
      "080", # Nordjylland
      "055", # Ribe
      "065", # Ringkǿbing
      "025", # Roskilde
      "035", # Storstrǿm
      "050", # Sǿnderjylland
      "060", # Vejle
      "030", # Vestsjælland
      "076", # Viborg
      "070", # Århus
      # Djibouti
      "AS", # Ali Sabieh
      "DI", # Dikhil
      "DJ", # Djibouti
      "OB", # Obock
      "TA", # Tadjoura
      # Dominica
      "DM", # Dominica
      # Dominican Republic
      "DN", # Distrito National (Santo Domingo)
      "AZ", # Azua
      "BR", # Bahoruco
      "BH", # Barahona
      "DA", # Dajabón
      "DU", # Duarte
      "SE", # El Seibo
      "EP", # La Estrelleta [Elías Piña]
      "HM", # Hato Mayor
      "IN", # Independencia
      "AL", # La Altagracia
      "RO", # La Romana
      "VE", # La Vega
      "MT", # María Trinidad Sánchez
      "MN", # Monseñor Nouel
      "MC", # Monte Cristi
      "MP", # Monte Plata
      "PN", # Pedernales
      "PR", # Peravia
      "PP", # Puerto Plata
      "SC", # Salcedo
      "SM", # Samaná
      "SZ", # Sanchez Ramírez
      "CR", # San Cristóbal
      "JU", # San Juan
      "PM", # San Pedro de Macorís
      "ST", # Santiago
      "SR", # Santiago Rodríguez
      "VA", # Valverde
      # Yugoslavia
      "CG", # Crna Gora
      "SR", # Srbija
      "KM", # Kosovo-Metohija
      "VO", # Vojvodina
      # Ecuador
      "A", # Azuay
      "B", # Bolívar
      "F", # Cañar
      "C", # Carchi
      "X", # Cotopaxi
      "H", # Chimborazo
      "O", # El Oro
      "E", # Esmeraldas
      "W", # Galápagos
      "G", # Guayas
      "I", # Imbabura
      "L", # Loja
      "R", # Los Ríos
      "M", # Manabí
      "S", # Morona-Santiago
      "N", # Napo
      "Y", # Pastaza
      "P", # Pichincha
      "U", # Sucumbíos
      "T", # Tungurahua
      "Z", # Zarnora-Chinchipe
      # Egypt
      "DK", # Ad Daqahlīyah
      "BA", # Al Baḩr al Aḩmar
      "BH", # Al Buḩayrah
      "FYM", # Al Fayyūm
      "GH", # Al Gharbīyah
      "ALX", # Al Iskandarīyah
      "IS", # Al Ismā‘īlīyah
      "GZ", # Al Jīzah
      "MNF", # Al Minūfīyah
      "MN", # Al Minyā
      "C", # Al Qāhirah
      "KB", # Al Qalyūbīyah
      "WAD", # Al Wādī al Jadīd
      "SHR", # Ash Sharqīyah
      "SUZ", # As Suways
      "ASN", # Aswān
      "AST", # Asyūţ
      "BNS", # Banī Suwayf
      "PTS", # Būr Sa‘īd
      "DT", # Dumyāţ
      "JS", # Janūb Sīnā'
      "KFS", # Kafr ash Shaykh
      "MT", # Maţrūḩ
      "KN", # Qinā
      "SIN", # Shamāl Sīnā'
      "SHG", # Sūhāj
      # El Salvador
      "AH", # Ahuachapán
      "CA", # Cabañas
      "CU", # Cuscatlán
      "CH", # Chalatenango
      "LI", # La Libertad
      "PA", # La Paz
      "UN", # La Unión
      "MO", # Morazán
      "SM", # San Miguel
      "SS", # San Salvador
      "SA", # Santa Ana
      "SV", # San Vicente
      "SO", # Sonsonate
      "SU", # Usulután
      # Equatorial Guinea
      "C", # Región Continental
      "CS", # Centro Sur
      "KN", # Kie-Ntem
      "LI", # Litoral
      "WN", # Wele-Nzás
      "I", # Región Insular
      "AN", # Annobón
      "BN", # Bioko Norte
      "BS", # Bioko Sur
      # Eritrea
      "AG", # Akele Guzai [Akalä Guzay]
      "AS", # Asmara [Asmära]
      "BA", # Barka
      "DE", # Denkalia [Dänkali]
      "GS", # Gash-Setit [Gaš enna Sätit]
      "HA", # Hamasien [Hamasén]
      "SA", # Sahel
      "SM", # Semhar [Sämhar]
      "SN", # Senhit [Sänhet]
      "SR", # Seraye [Särayé]
      # Estonia
      "37", # Harjumaa
      "39", # Hiiumaa
      "44", # Ida-Virumaa
      "49", # Jōgevamaa
      "51", # Järvamaa
      "57", # Läänemaa
      "59", # Lääne-Virumaa
      "65", # Pōlvamaa
      "67", # Pärnumaa
      "70", # Raplamaa
      "74", # Saaremaa
      "78", # Tartumaa
      "82", # Valgamaa
      "84", # Viljandimaa
      "86", # Vōrumaa
      # Ethiopia
      "AA", # Addis Ababa [Addis Abeba]
      "AF", # Afar
      "AM", # Amara [Amhara]
      "BE", # Benshangul-Gumaz [Bénishangul]
      "GA", # Gambela Peoples [Gambéla]
      "HA", # Harari People [Harer]
      "OR", # Oromia [Oromo]
      "SO", # Somali
      "SN", # Southern Nations, Nationalities and Peoples
      "TI", # Tigrai [Tegré]
      # Falkland Islands (Malvinas)
      "FK", # Falkland Islands (Malvinas)
      # Faroe Islands
      "FO", # Faroe Islands
      # Fiji
      "C", # Central
      "E", # Eastern
      "N", # Northern
      "W", # Western
      "R", # Rotuma
      # Finland
      "AL", # Ahvenanmaan lääni
      "ES", # Etelä-Suomen lääni
      "IS", # Itä-Suomen lääni
      "LL", # Lapin lääni
      "LS", # Länsi-Suomen lääni
      "OL", # Oulun lääni
      # France
      "A", # Alsace
      "67", # Bas-Rhin
      "68", # Haut-Rhin
      "B", # Aquitaine
      "79", # Deux-Sèvres
      "24", # Dordogne
      "33", # Gironde
      "40", # Landes
      "47", # Lot-et-Garonne
      "64", # Pyrénées-Atlantiques
      "C", # Auvergne
      "03", # Allier
      "15", # Cantal
      "43", # Haute-Loire
      "63", # Puy-de-Dôme
      "P", # Basse-Normandie
      "14", # Calvados
      "50", # Manche
      "61", # Orne
      "D", # Bourgogne
      "21", # Côte-d'Or
      "58", # Nièvre
      "71", # Saône-et-Loire
      "89", # Yonne
      "E", # Bretagne
      "22", # Cotes-d'Armor
      "29", # Finistère
      "35", # Ille-et-Vilaine
      "56", # Morbihan
      "F", # Centre
      "18", # Cher
      "28", # Eure-et-Loir
      "36", # Indre
      "37", # Indre-et-Loire
      "41", # Loir-et-Cher
      "45", # Loiret
      "G", # Champagne-Ardenne
      "08", # Ardennes
      "10", # Aube
      "52", # Haute-Marne
      "51", # Marne
      "H", # Corse
      "2A", # Corse-du-Sud
      "2B", # Haute-Corse
      "I", # Franche-Comté
      "25", # Doubs
      "70", # Haute-Saône
      "39", # Jura
      "90", # Territoire de Belfort
      "Q", # Haute-Normandie
      "27", # Eure
      "76", # Seine-Maritime
      "J", # Île-de-France
      "91", # Essonne
      "92", # Hauts-de-Seine
      "75", # Paris
      "77", # Seine-et-Marne
      "93", # Seine-Saint-Denis
      "94", # Val-de-Marne
      "95", # Val-d'Oise
      "78", # Yvelines
      "K", # Languedoc-Roussillon
      "11", # Aude
      "30", # Gard
      "34", # Hérault
      "48", # Lozère
      "66", # Pyrénées-Orientales
      "L", # Limousin
      "19", # Corrèze
      "23", # Creuse
      "87", # Haute-Vienne
      "M", # Lorraine
      "54", # Meurthe-et-Moselle
      "55", # Meuse
      "57", # Moselle
      "88", # Vosges
      "N", # Midi-Pyrénées
      "09", # Ariège
      "12", # Aveyron
      "32", # Gers
      "31", # Haute-Garonne
      "65", # Hautes-Pyrénées
      "46", # Lot
      "81", # Tarn
      "82", # Tarn-et-Garonne
      "O", # Nord-Pas-de-Calais
      "59", # Nord
      "62", # Pas-de-Calais
      "R", # Pays de la Loire
      "44", # Loire-Atlantique
      "49", # Maine-et-Loire
      "53", # Mayenne
      "72", # Sarthe
      "85", # Vendée
      "S", # Picardie
      "02", # Aisne
      "60", # Oise
      "80", # Somme
      "T", # Poitou-Charentes
      "16", # Charente
      "17", # Charente-Maritime
      "86", # Vienne
      "U", # Provence-Alpes-Côte d'Azur
      "04", # Alpes-de-Haute-Provence
      "06", # Alpes-Maritimes
      "13", # Bauches-du-Rhône
      "05", # Hautes-Alpes
      "83", # Var
      "84", # Vaucluse
      "V", # Rhône-Alpes
      "01", # Ain
      "07", # Ardèche
      "26", # Drôme
      "74", # Haute-Savoie
      "38", # Isère
      "42", # Loire
      "69", # Rhône
      "73", # Savoie
      "GP", # Guadeloupe
      "GF", # Guyane (francaise)
      "MQ", # Martinique
      "RE", # Réunion
      "YT", # Mayotte
      "PM", # Saint-Pierre-et-Miquelon
      "NC", # Nouvelle-Calédonie
      "PF", # Polynésie française
      "TF", # Terres Australes
      "WF", # Wallis et Futuna
      # French Guiana
      "GF", # French Guiana
      # French Polynesia
      "PF", # French Polynesia
      # French Southern Territories
      "TF", # French Southern Territories
      # Gabon
      "1", # Estuaire
      "2", # Haut-Ogooué
      "3", # Moyen-Ogooué
      "4", # Ngounié
      "5", # Nyanga
      "6", # Ogooué-Ivindo
      "7", # Ogooué-Lolo
      "8", # Ogooué-Maritime
      "9", # Woleu-Ntem
      # Gambia
      "B", # Banjul
      "L", # Lower River
      "M", # MacCarthy Island
      "N", # North Bank
      "U", # Upper River
      "W", # Western
      # Georgia
      "AB", # Ap'khazet'is Avtonomiuri Respublika [Abkhazia]
      "AJ", # Acharis Avtonomiuri Respublika [Ajaria]
      "BUS", # Bat'umi
      "CHI", # Chiat'ura
      "GAG", # Gagra
      "GOR", # Gori
      "KUT", # K'ut'aisi
      "PTI", # P'ot'i
      "RUS", # Rust'avi
      "SUI", # Sokhumi
      "TBS", # T'bilisi
      "TQI", # Tqibuli
      "TQV", # Tqvarch'eli
      "TSQ", # Tsqalmbo
      "ZUG", # Zugdidi
      "01", # Abashis Raioni
      "02", # Adigenis Raioni
      "03", # Akhalgoris Raioni
      "04", # Akhalk'alak'is Raioni
      "05", # Akhalts'ikhis Raioni
      "06", # Akhmetis Raioni
      "07", # Ambrolauris Raioni
      "08", # Aspindzis Raioni
      "09", # Baghdat'is Raioni
      "10", # Bolnisis Raioni
      "11", # Borjomis Raioni
      "12", # Ch'khorotsqus Raioni
      "13", # Ch'okhatauris Raioni
      "14", # Dedop'listsqaros Raioni
      "15", # Dmanisis Raioni
      "16", # Dushet'is Raioni
      "17", # Galis Raioni
      "18", # Gardabnis Raioni
      "19", # Goris Raioni
      "20", # Gudaut'is Raioni
      "21", # Gulrip'shis Raioni
      "22", # Gurjaanis Raioni
      "23", # Javis Raioni
      "24", # K'arelis Raioni
      "25", # Kaspis Raioni
      "26", # K'edis Raioni
      "27", # Kharagaulis Raioni
      "28", # Khashuris Raioni
      "29", # Khelvach'auris Raioni
      "30", # Khobis Raioni
      "31", # Khonis Raioni
      "32", # Khulos Raioni
      "33", # K'obuletis Raioni
      "34", # Lagodekhis Raioni
      "35", # Lanch'khut'is Raioni
      "36", # Lentekhis Raioni
      "37", # Marneulis Raioni
      "38", # Martvilis Raioni
      "39", # Mestiis Raioni
      "40", # Mts'khet'is Raioni
      "41", # Ninotsmindis Raioni
      "42", # Och'amch'iris Raioni
      "43", # Onis Raioni
      "44", # Ozurget'is Raioni
      "45", # Qazbegis Raioni
      "46", # Qvarlis Raioni
      "47", # Sach'kheris Raioni
      "48", # Sagarejos Raioni
      "49", # Samtrediis Raioni
      "50", # Senakis Raioni
      "51", # Shuakhevis Raioni
      "52", # Sighnaghis Raioni
      "53", # Sokhumis Raioni
      "54", # T'elavis Raioni
      "55", # T'erjolis Raioni
      "56", # T'et'ritsqaros Raioni
      "57", # T'ianet'is Raioni
      "58", # Ts'ageris Raioni
      "59", # Tsalenjikhis Raioni
      "60", # Tsalkis Raioni
      "61", # Vanis Raioni
      "62", # Zestap'onis Raioni
      "63", # Zugdidis Raioni
      # Germany
      "BW", # Baden-Württemberg
      "BY", # Bayern
      "BE", # Berlin
      "BB", # Brandenburg
      "HB", # Bremen
      "HH", # Hamburg
      "HE", # Hessen
      "MV", # Mecklenburg-Vorpommern
      "NI", # Niedersachsen
      "NW", # Nordrhein-Westfalen
      "RP", # Rheinland-Pfalz
      "SL", # Saarland
      "SN", # Sachsen
      "ST", # Sachsen-Anhalt
      "SH", # Schleswig-Holstein
      "TH", # Thüringen
      # Ghana
      "AH", # Ashanti
      "BA", # Brong-Ahafo
      "CP", # Central
      "EP", # Eastern
      "AA", # Greater Accra
      "NP", # Northern
      "UE", # Upper East
      "UW", # Upper West
      "TV", # Volta
      "WP", # Western
      # Gibraltar
      "GI", # Gibraltar
      # United Kingdom
      "CHA", # Channel Islands
      "GSY", # Guernsey [Guernesey]
      "JSY", # Jersey
      "ENG", # England
      "BDG", # Barking and Dagenham
      "BNE", # Barnet
      "BNS", # Barnsley
      "BAS", # Bath and North East Somerset
      "BDF", # Bedfordshire
      "BEX", # Bexley
      "BIR", # Birmingham (City of)
      "BBD", # Blackburn with Darwen
      "BPL", # Blackpool
      "BOL", # Bolton
      "BMH", # Bournemouth
      "BRC", # Bracknell Forest
      "BRD", # Bradford (City of)
      "BEN", # Brent
      "BNH", # Brighton and Hove
      "BST", # Bristol, City of
      "BRY", # Bromley
      "BKM", # Buckinghamshire
      "BUR", # Bury
      "CLD", # Calderdale
      "CAM", # Cambridgeshire
      "CMD", # Camden
      "CHS", # Cheshire
      "CON", # Cornwall
      "COV", # Coventry (City of)
      "CRY", # Croydon
      "CMA", # Cumbria
      "DAL", # Darlington
      "DER", # Derby (City of)
      "DBY", # Derbyshire
      "DEV", # Devon
      "DNC", # Doncaster
      "DOR", # Dorset
      "DUD", # Dudley
      "DUR", # Durharn
      "EAL", # Ealing
      "ERY", # East Riding of Yorkshire
      "ESX", # East Sussex
      "ENF", # Enfield
      "ESS", # Essex
      "GAT", # Gateshead
      "GLS", # Gloucestershire
      "GRE", # Greenwich
      "HCK", # Hackney
      "HAL", # Haiton
      "HMF", # Hammersmith and Fulham
      "HAM", # Hampshire
      "HRY", # Haringey
      "HRW", # Harrow
      "HPL", # Hartlepool
      "HAV", # Havering
      "HEF", # Herefordshire, County of
      "HRT", # Hertfordshire
      "HIL", # Hillingdon
      "HNS", # Hounslow
      "IOW", # Isle of Wight
      "IOS", # Isles of Scilly
      "ISL", # Islington
      "KEC", # Kensington and Chelsea
      "KEN", # Kent
      "KHL", # Kingston upon Hull, City of
      "KTT", # Kingston upon Thames
      "KIR", # Kirklees
      "KWL", # Knowsley
      "LBH", # Lambeth
      "LAN", # Lancashire
      "LDS", # Leeds (City of)
      "LCE", # Leitester (City of)
      "LEC", # Leicestershire
      "LEW", # Lewisham
      "LIN", # Lincolnshire
      "LIV", # Liverpool (City of)
      "LND", # London, City of
      "LUT", # Luton
      "MAN", # Manchester (City of)
      "MDW", # Medway
      "MRT", # Merton
      "MDB", # Middlesbrough
      "MIK", # Milton Keynes
      "NET", # Newcastle upon Tyne (City of)
      "NWM", # Newham
      "NFK", # Norfolk
      "NEL", # North East Lincolnshire
      "NLN", # North Lincolnshire
      "NSM", # North Somerset
      "NTY", # North Tyneside
      "NYK", # North Yorkshire
      "NTH", # Northamptonshire
      "NBL", # Northumberland
      "NGM", # Nottingham (City of)
      "NTT", # Nottinghamshire
      "OLD", # Oldham
      "OXF", # Oxfordshire
      "PTE", # Peterborough
      "PLY", # Plymouth (City of)
      "POL", # Poole
      "POR", # Portsmouth (City of)
      "RDG", # Reading
      "RDB", # Redbridge
      "RCC", # Redcar and Cleveland
      "RIC", # Richmond upon Thames
      "RCH", # Rochdale
      "ROT", # Rotherharn
      "RUT", # Rutland
      "SHN", # St. Helens
      "SLF", # Salford (City of)
      "SAW", # Sandweil
      "SFT", # Sefton
      "SHF", # Sheffield (City of)
      "SHR", # Shropshire
      "SLG", # Slough
      "SOL", # Solihull
      "SOM", # Somerset
      "SGC", # South Gloucestershire
      "STY", # South Tyneside
      "STH", # Southampton (City of)
      "SOS", # Southend-on-Sea
      "SWK", # Southwark
      "STS", # Staffordshire
      "SKP", # Stockport
      "STT", # Stockton-On-Tees
      "STE", # Stoke-on-Trent (City of)
      "SFK", # Suffolk
      "SND", # Sunderland (City of)
      "SRY", # Surrey
      "STN", # Sutton
      "SWD", # Swindon
      "TAM", # Tameside
      "TFW", # Telford and Wrekin
      "THR", # Thurrock
      "TOB", # Torbay
      "TWH", # Tower Hamlets
      "TRF", # Trafford
      "WKF", # Wakefield (City of)
      "WLL", # Walsall
      "WFT", # Waltham Forest
      "WND", # Wandsworth
      "WRT", # Warrington
      "WAR", # Warwickshire
      "WBK", # West Berkshire
      "WSX", # West Sussex
      "WSM", # Westminster (City of)
      "WGN", # Wigan
      "WIL", # Wiltshire
      "WNM", # Windsor and Maidenhead
      "WRL", # Wirral
      "WOK", # Wokingham
      "WLV", # Wolverhampton
      "WOR", # Worcestershire
      "YOR", # York (City of)
      "IOM", # Isle of Man
      "NIR", # Northern Ireland
      "ANT", # Antrim
      "ARD", # Ards
      "ARM", # Armagh
      "BLA", # Ballymena
      "BLY", # Ballymoney
      "BNB", # Banbridge
      "BFS", # Belfast (City of)
      "CKF", # Carrickfergus
      "CSR", # Castlereagh
      "CLR", # Coleraine
      "CKT", # Cookstown
      "CGV", # Craigavon
      "DRY", # Derry (City of)
      "DOW", # Down
      "DGN", # Dungannon
      "FER", # Fermanagh
      "LRN", # Larne
      "LMV", # Limavady
      "LSB", # Lisburn
      "MFT", # Magherafelt
      "MYL", # Moyle
      "NYM", # Newry and Mourne
      "NTA", # Newtownabbey
      "NDN", # North Down
      "OMH", # Omagh
      "STB", # Strabane
      "SCT", # Scotland
      "ABE", # Aberdeen City
      "ABD", # Aberdeenshire
      "ANS", # Angus
      "AGB", # Argyll and Bute
      "CLK", # Clackmannanshire
      "DGY", # Dumfries and Galloway
      "DND", # Dundee City
      "EAY", # East Ayrshire
      "EDU", # East Dunbartonshire
      "ELN", # East Lothian
      "ERW", # East Renfrewshire
      "EDH", # Edinburgh, City of
      "ELS", # Eilean Siar
      "FAL", # Falkirk
      "FIF", # Fife
      "GLG", # Glasgow City
      "HLD", # Highland
      "IVC", # Inverclyde
      "MLN", # Midlothian
      "MRY", # Moray
      "NAY", # North Ayrshire
      "NLK", # North Lanarkshire
      "ORK", # Orkney Islands
      "PKN", # Perth and Kinross
      "RFW", # Renfrewshire
      "SCB", # Scottish Borders, The
      "ZET", # Shetland Islands
      "SAY", # South Ayrshire
      "SLK", # South Lanarkshire
      "STG", # Stirling
      "WDU", # West Dunbartonshire
      "WLN", # West Lothian
      "WLS", # Wales [Cymru]
      "BGW", # Blaenau Gwent
      "BGE", # Bridgend [Pen-y-bont ar Ogwr GB-POG]
      "CAY", # Caerphilly [Caerffili GB-CAF]
      "CRF", # Cardiff (City of) [Caerdydd GB-CRD]
      "CMN", # Carmarthenshire [Sir Gaerfyrddin GB-GFY]
      "CGN", # Ceredigion [Sir Ceredigion]
      "CWY", # Conwy
      "DEN", # Denbighshire [Sir Ddinbych GB-DDB]
      "FLN", # Flintshire [Sir y Fflint GB-FFL]
      "GWN", # Gwynedd
      "AGY", # Isle of Anglesey [Sir Ynys Man GB-YNM]
      "MTY", # Merthyr Tydfil [Merthyr Tudful GB-MTU]
      "MON", # Monmouthshire [Sir Fynwy GB-FYN]
      "NTL", # Neath Port Talbot [Castell-nedd Port Talbot GB-CTL]
      "NWP", # Newport [Casnewydd GB-CNW]
      "PEM", # Pembrokeshire [Sir Benfro CB-BNF]
      "POW", # Powys
      "RCT", # Rhondda, Cynon, Taff [Rhondda, Cynon, Taf]
      "SWA", # Swansea (City of) [Abertawe GB-ATA]
      "TOF", # Torfaen [Tor-faen]
      "VGL", # Vale of Glamorgan, The [Bro Morgannwg GB-BMG]
      "WRX", # Wrexham [Wrecsam GB-WRC]
      # Greece
      "I", # Anatoliki Makedonia kai Thraki
      "52", # Drama
      "71", # Evros
      "55", # Kavalla
      "73", # Rodopi
      "72", # Xanthi
      "IX", # Attiki
      "A1", # Attiki
      "VII", # Dytiki Ellada
      "13", # Achaïa
      "01", # Aitolia-Akarnania
      "14", # Ileia
      "III", # Dytiki Makedonia
      "63", # Florina
      "51", # Grevena
      "56", # Kastoria
      "58", # Kozani
      "VI", # Ionioi Nisoi
      "23", # Kefallinia
      "22", # Kerkyra
      "24", # Lefkas
      "21", # Zakynthos
      "IV", # Ipeiros
      "31", # Arta
      "33", # Ioannina
      "34", # Preveza
      "32", # Thesprotia
      "II", # Kentriki Makedonia
      "64", # Chalkidiki
      "53", # Imathia
      "57", # Kilkis
      "59", # Pella
      "61", # Pieria
      "62", # Serrai
      "54", # Thessaloniki
      "XIII", # Kriti
      "94", # Chania
      "91", # Irakleion
      "92", # Lasithion
      "93", # Rethymnon
      "XII", # Notio Aigaio
      "81", # Dodekanisos
      "82", # Kyklades
      "X", # Peloponnisos
      "11", # Argolis
      "12", # Arkadia
      "15", # Korinthia
      "16", # Lakonia
      "17", # Messinia
      "VIII", # Sterea Ellada
      "05", # Evrytania
      "04", # Evvoia
      "07", # Fokis
      "06", # Fthiotis
      "03", # Voiotia
      "V", # Thessalia
      "41", # Karditsa
      "42", # Larisa
      "43", # Magnisia
      "44", # Trikala
      "XI", # Voreio Aigaio
      "85", # Chios
      "83", # Lesvos
      "84", # Samos
      # Greenland
      "GL", # Greenland
      # Grenada
      "GD", # Grenada
      # Guadeloupe
      "GP", # Guadeloupe
      # Guam
      "GU", # Guam
      # Guatemala
      "AV", # Alta Verapaz
      "BV", # Baja Verapaz
      "CM", # Chimaltenango
      "CQ", # Chiquimula
      "PR", # El Progreso
      "ES", # Escuintla
      "GU", # Guatemala
      "HU", # Huehuetenango
      "IZ", # Izabal
      "JA", # Jalapa
      "JU", # Jutiapa
      "PE", # Petén
      "QZ", # Quezaltenango
      "QC", # Quiché
      "RE", # Retalhuleu
      "SA", # Sacatepéquez
      "SM", # San Marcos
      "SR", # Santa Rosa
      "SO", # Sololá
      "SU", # Suchitepéquez
      "TO", # Totonicapán
      "ZA", # Zacapa
      # Guinea
      "B", # Bake, Gouvernorat de
      "BF", # Boffa
      "BK", # Boké
      "FR", # Fria
      "GA", # Gaoual
      "KD", # Kindia
      "C", # Conakry, Gouvernorat de
      "F", # Faranah, Gouvernorat de
      "DB", # Dabola
      "DI", # Dinguiraye
      "FA", # Faranah
      "KS", # Kissidougou
      "K", # Kankan, Gouvernorat de
      "KA", # Kankan
      "KE", # Kérouané
      "KO", # Kouroussa
      "MD", # Mandiana
      "SI", # Siguiri
      "D", # Kindia, Gouvernorat de
      "CO", # Coyah
      "DU", # Dubréka
      "FO", # Forécariah
      "TE", # Télimélé
      "L", # Labé, Gouvernorat de
      "KB", # Koubia
      "LA", # Labé
      "LE", # Lélouma
      "ML", # Mali
      "TO", # Tougué
      "M", # Mamou, Gouvernorat de
      "DL", # Dalaba
      "MM", # Mamou
      "PI", # Pita
      "N", # Nzérékoré, Gouvernorat de
      "BE", # Beyla
      "GU", # Guékédou
      "LO", # Lola
      "MC", # Macenta
      "NZ", # Nzérékoré
      "YO", # Yomou
      # Guinea-Bissau
      "BS", # Bissau
      "BA", # Bafatá
      "BM", # Biombo
      "BL", # Bolama
      "CA", # Cacheu
      "GA", # Gabú
      "OI", # Oio
      "QU", # Quinara
      # Guyana
      "BA", # Barima-Waini
      "CU", # Cuyuni-Mazaruni
      "DE", # Demerara-Mahaica
      "EB", # East Berbice-Corentyne
      "ES", # Essequibo Islands-West Demerara
      "MA", # Mahaica-Berbice
      "PM", # Pomeroon-Supenaam
      "PT", # Potaro-Siparuni
      "UD", # Upper Demerara-Berbice
      "UT", # Upper Takutu-Upper Essequibo
      # Haiti
      "AR", # Artibonite
      "CE", # Centre
      "GA", # Grande-Anse
      "ND", # Nord
      "NE", # Nord-Est
      "NO", # Nord-Ouest
      "OU", # Ouest
      "SD", # Sud
      "SE", # Sud-Est
      # Heard & McDonald Islands
      "HM", # Heard & McDonald Islands
      # Vatican City (Holy See)
      "VA", # Vatican City (Holy See)
      # Honduras
      "AT", # Atlántida
      "CL", # Colón
      "CM", # Comayagua
      "CP", # Copán
      "CR", # Cortés
      "CH", # Choluteca
      "EP", # El Paraíso
      "FM", # Francisco Morazán
      "GD", # Gracias a Dios
      "IN", # Intibucá
      "IB", # Islas de la Bahía
      "LP", # La Paz
      "LE", # Lempira
      "OC", # Ocotepeque
      "OL", # Olancho
      "SB", # Santa Bárbara
      "VA", # Valle
      "YO", # Yoro
      # Hong Kong
      "HK", # Hong Kong
      # Hungary
      "BU", # Budapest
      "BK", # Bács-Kiskun
      "BA", # Baranya
      "BE", # Békés
      "BZ", # Borsod-Abaúj-Zemplén
      "CS", # Csongrád
      "FE", # Fejér
      "GS", # Gyór-Moson-Sopron
      "HB", # Hajdú-Bihar
      "HE", # Heves
      "JN", # Jasz-Nagykun-Szolnok
      "KE", # Komárom-Esztergom
      "NO", # Nógrád
      "PE", # Pest
      "SO", # Somogy
      "SZ", # Szabolcs-Szatmár-Bereg
      "TO", # Tolna
      "VA", # Vas
      "VE", # Veszprém
      "ZA", # Zala
      "BC", # Békéscsaba
      "DE", # Debrecen
      "DU", # Dunaújváros
      "EG", # Eger
      "GY", # Gyór
      "HV", # Hódmezóvásárhely
      "KV", # Kaposvár
      "KM", # Kecskemét
      "MI", # Miskolc
      "NK", # Nagykanizsa
      "NY", # Nyíregyháza
      "PS", # Pécs
      "ST", # Salgótarján
      "SN", # Sopron
      "SD", # Szeged
      "SF", # Székesfehérvár
      "SS", # Szekszárd
      "SK", # Szolnok
      "SH", # Szombathely
      "TB", # Tatabánya
      "VM", # Veszprém
      "ZE", # Zalaegerszeg
      # Iceland
      "7", # Austurland
      "1", # Höfudborgarsvædi utan Reykjavíkur
      "6", # Nordurland eystra
      "5", # Nordurland vestra
      "0", # Reykjavīk
      "8", # Sudurland
      "2", # Sudurnes
      "4", # Vestfirdir
      "3", # Vesturland
      # India
      "AP", # Andhra Pradesh
      "AR", # Arunachal Pradesh
      "AS", # Assam
      "BR", # Bihar
      "GA", # Goa
      "GJ", # Gujarat
      "HR", # Haryana
      "HP", # Himachal Pradesh
      "JK", # Jammu and Kashmir
      "KA", # Karnataka
      "KL", # Kerala
      "MP", # Madhya Pradesh
      "MH", # Maharashtra
      "MN", # Manipur
      "ML", # Meghalaya
      "MZ", # Mizoram
      "NL", # Nagaland
      "OR", # Orissa
      "PB", # Punjab
      "RJ", # Rajasthan
      "SK", # Sikkim
      "TN", # Tamil Nadu
      "TR", # Tripura
      "UP", # Uttar Pradesh
      "WB", # West Bengal
      "AN", # Andaman and Nicobar Islands
      "CH", # Chandigarh
      "DN", # Dadra and Nagar Haveli
      "DD", # Daman and Diu
      "DL", # Delhi
      "LD", # Lakshadweep
      "PY", # Pondicherry
      # Indonesia
      "IJU", # Irian Jaya
      "IJ", # Irian Jaya
      "JWU", # Jawa
      "JB", # Jawa Barat
      "JT", # Jawa Tengah
      "JI", # Jawa Timur
      "JK", # Jakarta Raya
      "YO", # Yogyakarta
      "KAU", # Kalimantan
      "KB", # Kalimantan Barat
      "KS", # Kalimantan Selatan
      "KT", # Kalimantan Tengah
      "KI", # Kalimantan Timur
      "MAU", # Maluku
      "MA", # Maluku
      "NUU", # Nusa Tenggara
      "BA", # Bali
      "NB", # Nusa Tenggara Barat
      "NT", # Nusa Tenggara Timur
      "TT", # Timor Timur
      "SLU", # Sulawesi
      "SN", # Sulawesi Selatan
      "ST", # Sulawesi Tengah
      "SG", # Sulawesi Tenggara
      "SA", # Sulawesi Utara
      "SMU", # Sumatera
      "BE", # Bengkulu
      "JA", # Jambi
      "LA", # Lampung
      "RI", # Riau
      "SB", # Sumatera Barat
      "SS", # Sumatera Selatan
      "SU", # Sumatera Utara
      "AC", # Aceh
      # Iran
      "03", # Ardabīl
      "02", # Āzarbāyjān-e-Gharbī
      "01", # Āzarbāyjān-e-Sharqī
      "06", # Būshehr
      "08", # Chahār Maḩāll vā Bakhtīārī
      "04", # Eşfahān
      "14", # Fārs
      "19", # Gīlān
      "24", # Hamadān
      "23", # Hormozgān
      "05", # Īlām
      "15", # Kermān
      "17", # Kermānshāhān
      "09", # Khorāsān
      "10", # Khūzestān
      "18", # Kohkīlūyeh va Būyer Aḩmadī
      "16", # Kordestān
      "20", # Lorestān
      "22", # Markazī
      "21", # Māzandarān
      "26", # Qom
      "12", # Semnān
      "13", # Sīstān va Balūchestān
      "07", # Tehrān
      "25", # Yazd
      "11", # Zanjān
      # Iraq
      "AN", # Al Anbār
      "BA", # Al Başrah
      "MU", # Al Muthanná
      "QA", # Al Qādisīyah
      "NA", # An Najaf
      "AR", # Arbīl
      "SU", # As Sulaymānīyah
      "TS", # At Ta'mīm
      "BB", # Bābil
      "BG", # Baghdād
      "DA", # Dahūk
      "DQ", # Dhī Qār
      "DI", # Diyālá
      "KA", # Karbalā'
      "MA", # Maysān
      "NI", # Nīnawá
      "SD", # Şalāḩ ad Dīn
      "WA", # Wāsiţ
      # Ireland
      "CP", # Connaught (Connacht)
      "G", # Galway (Gaillimh)
      "LM", # Leitrim (Liatroim)
      "MO", # Mayo (Maigh Eo)
      "RN", # Roscommon (Ros Comáin)
      "SO", # Sligo (Sligeach)
      "LP", # Leinster (Laighin)
      "CW", # Carlow (Ceatharlach)
      "D", # Dublin (Baile Átha Cliath)
      "KE", # Kildare (Cill Dara)
      "KK", # Kilkenny (Cill Chainnigh)
      "LS", # Laois (Laois)
      "LD", # Longford (An Longfort)
      "LH", # Louth (Lú)
      "MH", # Meath (An Mhí)
      "OY", # Offaly (Uíbh Fhailí)
      "WH", # Westmeath (An Iarmhí)
      "WX", # Wexford (Loch Garman)
      "WW", # Wicklow (Cill Mhantáin)
      "M", # Munster (An Mhumhain)
      "UP", # Ulster (Ulaidh)
      "CN", # Cavan (An Cabhán)
      "DL", # Donegal (Dún na nGall)
      "MN", # Monaghan (Muineachán)
      # Israel
      "D", # HaDarom (El Janūbī)
      "M", # HaMerkaz (El Awsat)
      "2", # HaZafon (Esh Shamālī)
      "HA", # Hefa (Heifā)
      "TA", # Tel-Aviv (Tell Abīb)
      "JM", # Yerushalayim (Al Quds)
      # Italy
      "65", # Abruzzo
      "CH", # Chieti
      "AQ", # L'Aquila
      "PE", # Pescara
      "TE", # Teramo
      "77", # Basilicata
      "MT", # Matera
      "PZ", # Potenza
      "78", # Calabria
      "CZ", # Catanzaro
      "CS", # Cosenza
      "KR", # Crotone
      "RC", # Reggio Calabria
      "W", # Vibo Valentia
      "72", # Campania
      "AV", # Avellino
      "BN", # Benevento
      "CE", # Caserta
      "NA", # Napoli
      "SA", # Salerno
      "45", # Emilia-Romagna
      "BO", # Bologna
      "FE", # Ferrara
      "FO", # Forlì
      "MO", # Modena
      "PR", # Parma
      "PC", # Piacenza
      "RA", # Ravenna
      "RE", # Reggio Emilia
      "RN", # Rimini
      "36", # Friuli-Venezia Giulia
      "GO", # Gorizia
      "PN", # Pordenone
      "TS", # Trieste
      "UD", # Udine
      "62", # Lazio
      "FR", # Frosinone
      "LT", # Latina
      "RI", # Rieti
      "RM", # Roma
      "VT", # Viterbo
      "42", # Liguria
      "GE", # Genova
      "IM", # Imperia
      "SP", # La Spezia
      "SV", # Savona
      "25", # Lombardia
      "BG", # Bergamo
      "BS", # Brescia
      "CO", # Como
      "CR", # Cremona
      "LC", # Lecco
      "LO", # Lodi
      "MN", # Mantova
      "MI", # Milano
      "PV", # Pavia
      "SO", # Sondrio
      "VA", # Varese
      "57", # Marche
      "AN", # Ancona
      "AP", # Ascoli Piceno
      "MC", # Macerata
      "PS", # Pesaro
      "67", # Molise
      "CB", # Campobasso
      "IS", # Isernia
      "21", # Piemonte
      "AL", # Alessandria
      "AT", # Asti
      "BI", # Biella
      "CN", # Cuneo
      "NO", # Novara
      "TO", # Torino
      "VB", # Verbano-Cusio-Ossola
      "VC", # Vercelli
      "75", # Puglia
      "BA", # Bari
      "BR", # Brindisi
      "FG", # Foggia
      "LE", # Lecce
      "TA", # Taranto
      "88", # Sardegna
      "CA", # Cagliari
      "NU", # Nuoro
      "OR", # Oristano
      "SS", # Sassari
      "82", # Sicilia
      "AG", # Agrigento
      "CL", # Caltanissetta
      "CT", # Catania
      "EN", # Enna
      "ME", # Mesaina
      "PA", # Palermo
      "RG", # Ragusa
      "SR", # Siracusa
      "TP", # Trapani
      "52", # Toscana
      "AR", # Arezzo
      "FI", # Firenze
      "GR", # Grosseto
      "LI", # Livorno
      "LU", # Lucca
      "MS", # Massa
      "PI", # Pisa
      "PT", # Pistoia
      "PO", # Prato
      "SI", # Siena
      "32", # Trentino-Alte Adige (Trentino-Südtirol)
      "BZ", # Bolzano (Bozen)
      "TN", # Trento
      "55", # Umbria
      "PG", # Perugia
      "TR", # Terni
      "23", # Valle d'Aosta (Vallée d'Aoste)
      "AO", # Aosta (Aoste)
      "34", # Veneto
      "BL", # Belluno
      "PD", # Padova
      "RO", # Rovigo
      "TV", # Treviso
      "VE", # Venezia
      "VR", # Verona
      "VI", # Vicenza
      # Jamaica
      "13", # Clarendon
      "09", # Hanover
      "01", # Kingston
      "12", # Manchester
      "04", # Portland
      "02", # Saint Andrew
      "06", # Saint Ann
      "14", # Saint Catherine
      "11", # Saint Elizabeth
      "08", # Saint James
      "05", # Saint Mary
      "03", # Saint Thomas
      "07", # Trelawny
      "10", # Westmoreland
      # Japan
      "23", # Aiti [Aichi]
      "05", # Akita
      "02", # Aomori
      "38", # Ehime
      "21", # Gihu [Gifu]
      "10", # Gunma
      "34", # Hirosima [Hiroshima]
      "01", # Hokkaidô [Hokkaido]
      "18", # Hukui [Fukui]
      "40", # Hukuoka [Fukuoka]
      "07", # Hukusima [Fukushima]
      "28", # Hyôgo [Hyogo]
      "08", # Ibaraki
      "17", # Isikawa [Ishikawa]
      "03", # Iwate
      "37", # Kagawa
      "46", # Kagosima [Kagoshima]
      "14", # Kanagawa
      "39", # Kôti [Kochi]
      "43", # Kumamoto
      "26", # Kyôto [Kyoto]
      "24", # Mie
      "04", # Miyagi
      "45", # Miyazaki
      "20", # Nagano
      "42", # Nagasaki
      "29", # Nara
      "15", # Niigata
      "44", # Ôita [Oita]
      "33", # Okayama
      "47", # Okinawa
      "27", # Ôsaka [Osaka]
      "41", # Saga
      "11", # Saitama
      "25", # Siga [Shiga]
      "22", # Sizuoka [Shizuoka]
      "12", # Tiba [Chiba]
      "09", # Totigi [Tochigi]
      "36", # Tokusima [Tokushima]
      "13", # Tôkyô [Tokyo]
      "31", # Tottori
      "16", # Toyama
      "30", # Wakayama
      "06", # Yamagata
      "35", # Yamaguti [Yamaguchi]
      "19", # Yamanasi [Yamanashi]
      # Jordan
      "AJ", # ‘Ajlūn
      "AQ", # Al 'Aqaba
      "BA", # Al Balqā'
      "KA", # Al Karak
      "MA", # Al Mafraq
      "AM", # ‘Ammān
      "AT", # Aţ Ţafīlah
      "AZ", # Az Zarqā'
      "IR", # Irbid
      "JA", # Jarash
      "MN", # Ma‘ān
      "MD", # Mādaba
      # Kazakhstan
      "ALA", # Almaty
      "BAY", # Bayqonyr (Baykonyr)
      "ALM", # Almaty oblysy (Almatinskaya oblast')
      "AKM", # Aqmola oblysy (Akmolinskaya oblast')
      "AKT", # Aqtöbe oblysy (Aktyubinskaya oblast')
      "ATY", # Atyraü oblysy (Atyrauskaya oblast')
      "ZAP", # Batys Kazakstan oblysy (Zapadno-Kazakhstanskaya oblast')
      "MAN", # Mangghystaū oblysy (Mangystauskaya oblast')
      "YUZ", # Ongtüstik Kazakstan oblysy (Yuzhno-Kazakhstanskaya oblast')
      "PAV", # Pavlodar oblysy (Pavlodarskaya oblast')
      "KAR", # Qaraghandy oblysy (Karagandinskaya oblast')
      "KUS", # Qostanay oblysy (Kustanayskaya oblast')
      "KZY", # Qyzylorda oblysy (Kzylordinskaya oblast')
      "VOS", # Shyghys Kazakstan oblysy (Vostochno-Kazakhstanskaya oblast')
      "SEV", # Soltüstik Kazakstan oblysy (Severo-Kazakhstanskaya oblast')
      "ZHA", # Zhambyl oblysy (Zhambylskaya Oblast')
      # Kenya
      "110", # Nairobi Municipality
      "200", # Central (Kati)
      "300", # Coast (Pwani)
      "400", # Eastern (Mashariki)
      "500", # North-Eastern (Kaskazini Mashariki)
      "600", # Nyanza
      "700", # Rift Valley
      "900", # Western (Magharibi)
      # Kiribati
      "G", # Gilbert Islands
      "L", # Line Islands
      "P", # Phoenix Islands
      # Korea (North)
      "KAE", # Kaesong-si
      "NAM", # Nampo-si
      "PYO", # Pyongyang-si
      "CHA", # Chagang-do
      "HAB", # Hamgyongbuk-do
      "HAN", # Hamgyongnam-do
      "HWB", # Hwanghaebuk-do
      "HWN", # Hwanghaenam-do
      "KAN", # Kangwon-do
      "PYB", # Pyonganbuk-do
      "PYN", # Pyongannam-do
      "YAN", # Yanggang-do
      # Korea (South)
      "11", # Seoul Teugbyeolsi [ Seoul-T’ŭkpyŏlshi]
      "26", # Busan Gwang'yeogsi [Pusan-Kwangyŏkshi]
      "27", # Daegu Gwang'yeogsi [Taegu-Kwangyŏkshi)
      "30", # Daejeon Gwang'yeogsi [Taejŏn-Kwangyŏkshi]
      "29", # Gwangju Gwang'yeogsi [Kwangju-Kwangyŏkshi]
      "28", # Incheon Gwang'yeogsi [Inchŏn-Kwangyŏkshi]
      "31", # Ulsan Gwang'yeogsi [Ulsan-Kwangyŏkshi]
      "43", # Chungcheongbugdo [Ch'ungch'ŏngbuk-do]
      "44", # Chungcheongnamdo [Ch'ungch'ŏngnam-do]
      "42", # Gang'weondo [Kang-won-do]
      "41", # Gyeonggido [Kyŏnggi-do]
      "47", # Gyeongsangbugdo [Kyŏngsangbuk-do]
      "48", # Gyeongsangnamdo [Kyŏngsangnam-do]
      "49", # Jejudo [Cheju-do]
      "45", # Jeonrabugdo [Chŏllabuk-do)
      "46", # Jeonranamdo [Chŏllanam-do]
      # Kuwait
      "AH", # Al Aḩmadi
      "FA", # Al Farwānīyah
      "JA", # Al Jahrah
      "KU", # Al Kuwayt
      "HA", # Ḩawallī
      # Kyrgyzstan
      "C", # Chu (Chuyskaya oblast')
      "J", # Jalal-Abad (Dzhalal-Abadskaya oblast')
      "N", # Naryn (Narynskaya Oblast’)
      "O", # Osh (Oshskaya oblast')
      "T", # Talas (Talasskaya oblast')
      "Y", # Ysyk-Köl (Issyk-Kul'skaya oblast')
      # Laos
      "VT", # Vientiane
      "AT", # Attapu [Attopeu]
      "BK", # Bokèo
      "BL", # Bolikhamxai [Borikhane]
      "CH", # Champasak [Champassak]
      "HO", # Houaphan
      "KH", # Khammouan
      "LM", # Louang Namtha
      "LP", # Louangphabang [Louang Prabang]
      "OU", # Oudômxai [Oudomsai]
      "PH", # Phôngsali [Phong Saly]
      "SL", # Salavan [Saravane]
      "SV", # Savannakhét
      "VI", # Vientiane
      "XA", # Xaignabouli [Sayaboury]
      "XE", # Xékong [Sékong]
      "XI", # Xiangkhoang [Xieng Khouang]
      # Latvia
      "AI", # Aizkraukles Aprinkis
      "AL", # Alūksnes Aprinkis
      "BL", # Balvu Aprinkis
      "BU", # Bauskas Aprinkis
      "CE", # Cēsu Aprinkis
      "DA", # Daugavpils Aprinkis
      "DO", # Dobeles Aprinkis
      "GU", # Gulbenes Aprinkis
      "JL", # Jelgavas Aprinkis
      "JK", # Jēkabpils Aprinkis
      "KR", # Krāslavas Aprinkis
      "KU", # Kuldīgas Aprinkis
      "LM", # Limbažu Aprinkis
      "LE", # Liepājas Aprinkis
      "LU", # Ludzas Aprinkis
      "MA", # Madonas Aprinkis
      "OG", # Ogres Aprinkis
      "PR", # Preilu Aprinkis
      "RE", # Rēzeknes Aprinkis
      "RI", # Rīgas Aprinkis
      "SA", # Saldus Aprinkis
      "TA", # Talsu Aprinkis
      "TU", # Tukuma Aprinkis
      "VK", # Valkas Aprinkis
      "VM", # Valmieras Aprinkis
      "VE", # Ventspils Aprinkis
      "DGV", # Daugavpils
      "JEL", # Jelgava
      "JUR", # Jūrmala
      "LPX", # Liepāja
      "REZ", # Rēzekne
      "RIX", # Rīga
      "VEN", # Ventspils
      # Lebanon
      "BA", # Beiroût (Bayrūt)
      "BI", # El Béqaa (Al Biqā')
      "JL", # Jabal Loubnâne (Jabal Lubnān)
      "AS", # Loubnâne ech Chemâli (Ash Shamāl)
      "JA", # Loubnâne ej Jnoûbi (Al Janūb)
      "NA", # Nabatîyé (An Nabaţīyah
      # Lesotho
      "D", # Berea
      "B", # Butha-Buthe
      "C", # Leribe
      "E", # Mafeteng
      "A", # Maseru
      "F", # Mohale's Hoek
      "J", # Mokhotlong
      "H", # Qacha's Nek
      "G", # Quthing
      "K", # Thaba-Tseka
      # Liberia
      "BM", # Bomi
      "BG", # Bong
      "GB", # Grand Bassa
      "CM", # Grand Cape Mount
      "GG", # Grand Gedeh
      "GK", # Grand Kru
      "LO", # Lofa
      "MG", # Margibi
      "MY", # Maryland
      "MO", # Montserrado
      "NI", # Nimba
      "RI", # Rivercess
      "SI", # Sinoe
      # Libya
      "BU", # Al Buţnān
      "JA", # Al Jabal al Akhḑar
      "JG", # Al Jabal al Gharbī
      "Ju", # Al Jufrah
      "WA", # Al Wāḩah
      "Wu", # Al Wusţá
      "ZA", # Az Zāwiyah
      "BA", # Banghāzī
      "FA", # Fazzān
      "MI", # Mişrātah
      "NA", # Naggaza
      "SF", # Sawfajjin
      "TB", # Ţarābulus
      # Liechtenstein
      "LI", # Liechtenstein
      # Lithuania
      "AL", # Alytaus Apskritis
      "KU", # Kauno Apskritis
      "KL", # Klaipėdos Apskritis
      "MR", # Marijampolės Apskritis
      "PN", # Panevėžio Apskritis
      "SA", # Šiauliu Apskritis
      "TA", # Tauragės Apskritis
      "TE", # Telšiu Apskritis
      "UT", # Utenos Apskritis
      "VL", # Vilniaus Apskritis
      # Luxembourg
      "D", # Diekirch
      "G", # Grevenmacher
      "L", # Luxembourg (Luxemburg)
      # Macau
      "MO", # Macau
      # Macedonia
      "MK", # Macedonia
      # Madagascar
      "T", # Antananarivo
      "D", # Antsiranana
      "F", # Fianarantsoa
      "M", # Mahajanga
      "A", # Toamasina
      "U", # Toliara
      # Malawi
      "C", # Central
      "DE", # Dedza
      "DO", # Dowa
      "KS", # Kasungu
      "LI", # Lilongwe
      "MC", # Mchinji
      "NK", # Nkhotakota
      "NU", # Ntcheu
      "NI", # Ntchisi
      "SA", # Salima
      "N", # Northern
      "CT", # Chitipa
      "KR", # Karonga
      "MZ", # Mzimba
      "NB", # Nkhata Bay
      "RU", # Rumphi
      "S", # Southern
      "BL", # Blantyre
      "CK", # Chikwawa
      "CR", # Chiradzulu
      "MH", # Machinga
      "MG", # Mangochi
      "MU", # Mulanje
      "MW", # Mwanza
      "NS", # Nsanje
      "TH", # Thyolo
      "ZO", # Zomba
      # Malaysia
      "W", # Wilayah Persekutuan Kuala Lumpur
      "L", # Wilayah Persekutuan Labuan
      "J", # Johor
      "K", # Kedah
      "D", # Kelantan
      "M", # Melaka
      "N", # Negeri Sembilan
      "C", # Pahang
      "A", # Perak
      "R", # Perlis
      "P", # Pulau Pinang
      "SA", # Sabah
      "SK", # Sarawak
      "B", # Selangor
      "T", # Terengganu
      # Maldives
      "MLE", # Male
      "02", # Alif
      "20", # Baa
      "17", # Dhaalu
      "14", # Faafu
      "27", # Gaaf Alif
      "28", # Gaafu Dhaalu
      "29", # Gnaviyani
      "07", # Haa Alif
      "23", # Haa Dhaalu
      "26", # Kaafu
      "05", # Laamu
      "03", # Lhaviyani
      "12", # Meemu
      "25", # Noonu
      "13", # Raa
      "01", # Seenu
      "24", # Shaviyani
      "08", # Thaa
      "04", # Vaavu
      # Mali
      "BKO", # Bamako
      "7", # Gao
      "1", # Kayes
      "8", # Kidal
      "2", # Koulikoro
      "5", # Mopti
      "4", # Ségou
      "3", # Sikasso
      "6", # Tombouctou
      # Malta
      "MT", # Malta
      # Marshall Islands
      "L", # Ralik chain
      "ALL", # Ailinglapalap
      "EBO", # Ebon
      "ENI", # Eniwetok
      "JAL", # Jaluit
      "KIL", # Kili
      "KWA", # Kwajalein
      "LAE", # Lae
      "LIB", # Lib
      "NMK", # Namorik
      "NMU", # Namu
      "RON", # Rongelap
      "UJA", # Ujae
      "UJL", # Ujelang
      "WTH", # Wotho
      "T", # Ratak chain
      "ALK", # Ailuk
      "ARN", # Arno
      "AUR", # Aur
      "LIK", # Likiep
      "MAJ", # Majuro
      "MAL", # Maloelap
      "MEJ", # Mejit
      "MIL", # Mili
      "UTI", # Utirik
      "WTJ", # Wotje
      # Martinique
      "MQ", # Martinique
      # Mauritania
      "NKC", # Nouakchott
      "07", # Adrar
      "03", # Assaba
      "05", # Brakna
      "08", # Dakhlet Nouādhibou
      "04", # Gorgol
      "10", # Guidimaka
      "01", # Hodh ech Chargui
      "02", # Hodh el Gharbi
      "12", # Inchiri
      "09", # Tagant
      "11", # Tiris Zemmour
      "06", # Trarza
      # Mauritius
      "BR", # Beau Bassin-Rose Hill
      "CU", # Curepipe
      "PL", # Port Louis
      "QB", # Quatre Bornes
      "VP", # Vacoas-Phoenix
      "BL", # Black River
      "FL", # Flacq
      "GP", # Grand Port
      "MO", # Moka
      "PA", # Pamplemousses
      "PW", # Plaines Wilhems
      "RR", # Rivière du Rempart
      "SA", # Savanne
      "AG", # Agalega Islands
      "CC", # Cargados Carajos Shoals [Saint Brandon Islands]
      "RO", # Rodrigues Island
      # Mayotte
      "YT", # Mayotte
      # Mexico
      "DIF", # Distrito Federal
      "AGU", # Aguascalientes
      "BCN", # Baja California
      "BCS", # Baja California Sur
      "CAM", # Campeche
      "COA", # Coahuila
      "COL", # Colima
      "CHP", # Chiapas
      "CHH", # Chihuahua
      "DUR", # Durango
      "GRO", # Guerrero
      "GUA", # Guanajuato
      "HID", # Hidalgo
      "JAL", # Jalisco
      "MEX", # México
      "MIC", # Michoacán
      "MOR", # Morelos
      "NAY", # Nayarit
      "NLE", # Nuevo León
      "OAX", # Oaxaca
      "PUE", # Puebla
      "QUE", # Queretaro
      "ROO", # Quintana Roo
      "SLP", # San Luis Potosí
      "SIN", # Sinaloa
      "SON", # Sonora
      "TAB", # Tabasco
      "TAM", # Tamaulipas
      "TLA", # Tlaxcala
      "VER", # Veracruz
      "YUC", # Yucatán
      "ZAC", # Zacatecas
      # Micronesia
      "TRK", # chuuk
      "KSA", # Kosrae
      "PNI", # Pohnpei
      "YAP", # Yap
      # Moldova
      "BAL", # Bălţi
      "CAH", # Cahul
      "CHI", # Chişinău
      "DUB", # Dubăsari
      "ORH", # Orhei
      "RIB", # Rîbniţa
      "SOC", # Soroca
      "TIG", # Tighina
      "TIR", # Tiraspol
      "UNG", # Ungheni
      "ANE", # Anenii Noi
      "BAS", # Basarabeasca
      "BRI", # Brinceni
      "CHL", # Cahul
      "CAM", # Camenca
      "CAN", # Cantemir
      "CAI", # Căinari
      "CAL", # Călăraşi
      "CAS", # Căuşeni
      "CIA", # Ciadîr-Lunga
      "CIM", # Cimişlia
      "COM", # Comrat
      "CRI", # Criuleni
      "DON", # Donduşeni
      "DRO", # Drochia
      "DBI", # Dubăsari
      "EDI", # Edineţ
      "FAL", # Făleşti
      "FLO", # Floreşti
      "GLO", # Glodeni
      "GRI", # Grigoriopol
      "HIN", # Hînceşti
      "IAL", # Ialoveni
      "LEO", # Leova
      "NIS", # Nisporeni
      "OCN", # Ocniţa
      "OHI", # Orhei
      "REZ", # Rezina
      "RIT", # Rîbniţa
      "RIS", # Rîşcani
      "SIN", # Sîngerei
      "SLO", # Slobozia
      "SOA", # Soroca
      "STR", # Străşeni
      "SOL", # Şoldăneşti
      "STE", # Ştefan Vodă
      "TAR", # Taraclia
      "TEL", # Teleneşti
      "UGI", # Ungheni
      "VUL", # Vulcăneşti
      # Monaco
      "MC", # Monaco
      # Mongolia
      "1", # Ulaanbaatar
      "073", # Arhangay
      "069", # Bayanhongor
      "071", # Bayan-Ölgiy
      "067", # Bulgan
      "037", # Darhan uul
      "061", # Dornod
      "063", # Dornogovĭ
      "059", # Dundgovĭ
      "057", # Dzavhan
      "065", # Govĭ-Altay
      "064", # Govĭ-Sümber
      "039", # Hentiy
      "043", # Hovd
      "041", # Hövsgöl
      "053", # Ömnögovĭ
      "035", # Orhon
      "055", # Övörhangay
      "049", # Selenge
      "051", # Sühbaatar
      "047", # Töv
      "046", # Uvs
      # Montserrat
      "MS", # Montserrat
      # Morocco
      "CE", # Centre
      "AZI", # Azilal
      "BEM", # Beni Mellal
      "BES", # Ben Slimane
      "BOM", # Boulemane
      "CAS", # Casablanca [Dar el Beïda]
      "JDI", # El Jadida
      "KHO", # Khouribga
      "SET", # Settat
      "CN", # Centre-Nord
      "HOC", # Al Hoceïma
      "FES", # Fès
      "SEF", # Sefrou
      "TAO", # Taounate
      "TAZ", # Taza
      "CS", # Centre-Sud
      "HAJ", # El Hajeb
      "ERR", # Errachidia
      "IFR", # Ifrane
      "KHN", # Khenifra
      "MEK", # Meknès
      "ES", # Est
      "BER", # Berkane
      "FIG", # Figuig
      "IRA", # Jrada
      "NAD", # Nador
      "OUJ", # Oujda
      "NO", # Nord-Ouest
      "CHE", # Chefchaouene
      "KEN", # Kénitra
      "KHE", # Khemisset
      "LAR", # Larache
      "RBA", # Rabat-Salé
      "SIK", # Sidi Kacem
      "TNG", # Tanger
      "TET", # Tétouan
      "SU", # Sud
      "AGD", # Agadir
      "BAH", # Aït Baha
      "MEL", # Aït Melloul
      "ASZ", # Assa-Zag
      "BOD", # Boujdour (EH)
      "ESM", # Es Semara (EH)
      "GUE", # Guelmim
      "LAA", # Laayoune (EH)
      "OUA", # Ouarzazate
      "OUD", # Oued ed Dahab (EH)
      "TNT", # Tan-Tan
      "TAR", # Taroudannt
      "TAT", # Tata
      "TIZ", # Tiznit
      "TS", # Tensift
      "HAO", # Al Haouz
      "CHI", # Chichaoua
      "ESI", # Essaouira
      "KES", # Kelaat Sraghna
      "MAR", # Marrakech
      "SAF", # Safi
      # Mozambique
      "MPM", # Maputo
      "P", # Cabo Delgado
      "G", # Gaza
      "I", # Inhambane
      "B", # Manica
      "L", # Maputo
      "N", # Nampula
      "A", # Niassa
      "S", # Sofala
      "T", # Tete
      "Q", # Zambézia
      # Myanmar
      "07", # Ayeyarwady
      "02", # Bago
      "03", # Magway
      "04", # Mandalay
      "01", # Sagaing
      "05", # Tanintharyi
      "06", # Yangon
      "14", # Chin
      "11", # Kachin
      "12", # Kayah
      "13", # Kayin
      "15", # Mon
      "16", # Rakhine
      "17", # Shan
      # Namibia
      "CA", # Caprivi
      "ER", # Erongo
      "HA", # Hardap
      "KA", # Karas
      "KH", # Khomas
      "KU", # Kunene
      "OW", # Ohangwena
      "OK", # Okavango
      "OH", # Omaheke
      "OS", # Omusati
      "ON", # Oshana
      "OT", # Oshikoto
      "OD", # Otjozondjupa
      # Nauru
      "NR", # Nauru
      # Nepal
      "1", # Madhyamanchal
      "BA", # Bagmati
      "JA", # Janakpur
      "NA", # Narayani
      "2", # Madhya Pashchimanchal
      "BH", # Bheri
      "KA", # Karnali
      "RA", # Rapti
      "3", # Pashchimanchal
      "DH", # Dhawalagiri
      "GA", # Gandaki
      "LU", # Lumbini
      "4", # Purwanchal
      "KO", # Kosi [Koshi]
      "ME", # Mechi
      "SA", # Sagarmatha
      "5", # Sudur Pashchimanchal
      "MA", # Mahakali
      "SE", # Seti
      # Netherlands
      "DR", # Drenthe
      "FL", # Flevoland
      "FR", # Friesland
      "GE", # Gelderland
      "GR", # Groningen
      "LI", # Limburg
      "NB", # Noord-Brabant
      "NH", # Noord-Holland
      "OV", # Overijssel
      "UT", # Utrecht
      "ZE", # Zeeland
      "ZH", # Zuid-Holland
      # New Caledonia
      "NC", # New Caledonia
      # New Zealand
      "N", # North Island
      "AUK", # Auckland
      "BOP", # Bay of Plenty
      "GIS", # Gisborne
      "HKB", # Hawkes's Bay
      "MWT", # Manawatu-Wanganui
      "NTL", # Northland
      "TKI", # Taranaki
      "WKO", # Waikato
      "WGN", # Wellington
      "S", # South Island
      "CAN", # Canterbury
      "MBH", # Marlborough
      "NSN", # Nelson
      "OTA", # Otago
      "STL", # Southland
      "TAS", # Tasman
      "WTC", # West Coast
      # Nicaragua
      "BO", # Boaco
      "CA", # Carazo
      "CI", # Chinandega
      "CO", # Chontales
      "ES", # Estelí
      "GR", # Granada
      "JI", # Jinotega
      "LE", # León
      "MD", # Madriz
      "MN", # Manaqua
      "MS", # Masaya
      "MT", # Matagalpa
      "NS", # Nueva Segovia
      "SJ", # Río San Juan
      "RI", # Rivas
      "ZE", # Zelaya
      # Niger
      "8", # Niamey
      "1", # Agadez
      "2", # Diffa
      "3", # Dosso
      "4", # Maradi
      "5", # Tahoua
      "6", # Tillaberi
      "7", # Zinder
      # Nigeria
      "FC", # Abuja Capital Territory
      "AB", # Abia
      "AD", # Adamawa
      "AK", # Akwa Ibom
      "AN", # Anambra
      "BA", # Bauchi
      "BE", # Benue
      "BO", # Borno
      "CR", # Cross River
      "DE", # Delta
      "ED", # Edo
      "EN", # Enugu
      "IM", # Imo
      "JI", # Jigawa
      "KD", # Kaduna
      "KN", # Kano
      "KT", # Katsina
      "KE", # Kebbi
      "KO", # Kogi
      "KW", # Kwara
      "LA", # Lagos
      "NI", # Niger
      "OG", # Ogun
      "ON", # Ondo
      "OS", # Osun
      "OY", # Oyo
      "PL", # Plateau
      "RI", # Rivers
      "SO", # Sokoto
      "TA", # Taraba
      "YO", # Yobe
      # Niue
      "NU", # Niue
      # Norfolk Island
      "NF", # Norfolk Island
      # Northern Mariana Islands
      "MP", # Northern Mariana Islands
      # Norway
      "02", # Akershus
      "09", # Aust-Agder
      "06", # Buskerud
      "20", # Finnmark
      "04", # Hedmark
      "12", # Hordaland
      "15", # Møre og Romsdal
      "18", # Nordland
      "17", # Nord-Trøndelag
      "05", # Oppland
      "03", # Oslo
      "11", # Rogaland
      "14", # Sogn og Fjordane
      "16", # Sør-Trøndelag
      "08", # Telemark
      "19", # Troms
      "10", # Vest-Agder
      "07", # Vestfold
      "01", # Østfold
      "22", # Jan Mayen (Arctic Region)
      "21", # Svalbard (Arctic Region)
      # Oman
      "DA", # Ad Dākhilīyah
      "BA", # Al Bāţinah
      "JA", # Al Janūbīyah [Zufār]
      "WU", # Al Wusţā
      "SH", # Ash Sharqīyah
      "ZA", # Az Zāhirah
      "MA", # Masqaţ
      "MU", # Musandam
      # Pakistan
      "IS", # Islamabad
      "BA", # Baluchistan (Balochistān)
      "NW", # North-West Frontier
      "PB", # Punjab
      "SD", # Sind (Sindh)
      "TA", # Federally Administered Tribal Areas
      "JK", # Azad Kashmir
      "NA", # Northern Areas
      # Palau
      "PW", # Palau
      # Panama
      "1", # Botas del Toro
      "2", # Coclé
      "3", # Colón
      "4", # Chiriquī
      "5", # Darién
      "6", # Herrera
      "7", # Los Santos
      "8", # Panamá
      "9", # Veraguas
      "0", # Comarca de San Blas
      # Papua New Guinea
      "NCD", # National Capital District (Port Moresby)
      "CPM", # Central
      "CPK", # Chimbu
      "EHG", # Eastern Highlands
      "EBR", # East New Britain
      "ESW", # East Sepik
      "EPW", # Enga
      "GPK", # Gulf
      "MPM", # Madang
      "MRL", # Manus
      "MBA", # Milne Bay
      "MPL", # Morobe
      "NIK", # New Ireland
      "NPP", # Northern
      "NSA", # North Solomons
      "SAN", # Sandaun [West Sepik]
      "SHM", # Southern Highlands
      "WPD", # Western
      "WHM", # Western Highlands
      "WBK", # West New Britain
      # Paraguay
      "ASU", # Asunción
      "16", # Alto Paraguay
      "10", # Alto Parang
      "13", # Amambay
      "19", # Boquerón
      "5", # Caaguazú
      "6", # Caazapá
      "14", # Canindeyú
      "11", # Central
      "1", # Concepción
      "3", # Cordillera
      "4", # Guairá
      "7", # Itapúa
      "8", # Misiones
      "12", # Neembucú
      "9", # Paraguarī
      "15", # Presidente Hayes
      "2", # San Pedro
      # Peru
      "CAL", # El Callao
      "AMA", # Amazonas
      "ANC", # Ancash
      "APU", # Apurímac
      "ARE", # Arequipa
      "AYA", # Ayacucho
      "CAJ", # Cajamarca
      "CUS", # Cuzco [Cusco]
      "HUV", # Huancavelica
      "HUC", # Huánuco
      "ICA", # Ica
      "JUN", # Junín
      "LAL", # La Libertad
      "LAM", # Lambayeque
      "LIM", # Lima
      "LOR", # Loreto
      "MDD", # Madre de Dios
      "MOQ", # Moquegua
      "PAS", # Pasco
      "PIU", # Piura
      "PUN", # Puno
      "SAM", # San Martín
      "TAC", # Tacna
      "TUM", # Tumbes
      "UCA", # Ucayali
      # Philippines
      "PH", # Philippines
      # Pitcairn
      "PN", # Pitcairn
      # Poland
      "BP", # Biała Podlaska
      "BK", # Białystok
      "BB", # Bielsko
      "BY", # Bydgoszcz
      "CH", # Chełm
      "CI", # Ciechanów
      "CZ", # Czestochowa
      "EL", # Elblag
      "GD", # Gdańsk
      "GO", # Gorzów
      "JG", # Jelenia Gera
      "KL", # Kalisz
      "KA", # Katowice
      "KI", # Kielce
      "KN", # Konin
      "KO", # Koszalin
      "KR", # Kraków
      "KS", # Krosno
      "LG", # Legnica
      "LE", # Leszno
      "LU", # Lublin
      "LO", # Łomia
      "LD", # Łódź
      "NS", # Nowy Sacz
      "OL", # Olsztyn
      "OP", # Opole
      "OS", # Ostrołeka
      "PI", # Piła
      "PT", # Piotrków
      "PL", # Płock
      "PO", # Poznań
      "PR", # Przemyśl
      "RA", # Radom
      "RZ", # Rzeszów
      "SE", # Siedlce
      "SI", # Sieradz
      "SK", # Skierniewice
      "SL", # Słupsk
      "SU", # Suwałki
      "SZ", # Szczecin
      "TG", # Tarnobrzeg
      "TA", # Tarnów
      "TO", # Toruń
      "WB", # Wałbrzych
      "WA", # Warszawa
      "WL", # Włocławek
      "WR", # Wrocław
      "ZA", # Zamość
      "ZG", # Zielona Góra
      # Portugal
      "01", # Aveiro
      "02", # Beja
      "03", # Braga
      "04", # Bragança
      "05", # Castelo Branco
      "06", # Coimbra
      "07", # Évora
      "08", # Faro
      "09", # Guarda
      "10", # Leiria
      "11", # Lisboa
      "12", # Portalegre
      "13", # Porto
      "14", # Santarém
      "15", # Setúbal
      "16", # Viana do Castelo
      "17", # Vila Real
      "18", # Viseu
      "20", # Regiāo Autónoma dos Açores
      "30", # Regiāo Autónoma da Madeira
      # Puerto Rico
      "PR", # Puerto Rico
      # Qatar
      "DA", # Ad Dawḩah
      "GH", # Al Ghuwayrīyah
      "JU", # Al Jumaylīyah
      "KH", # Al Khawr
      "WA", # Al Wakrah
      "RA", # Ar Rayyān
      "JB", # Jarīyān al Bāţnah
      "MS", # Madīnat ash Shamāl
      "US", # Umm Şalāl
      # Reunion
      "RE", # Reunion
      # Romania
      "B", # Bucureşti
      "AB", # Alba
      "AR", # Arad
      "AG", # Argeş
      "BC", # Bacău
      "BH", # Bihor
      "BN", # Bistriţa-Năsăud
      "BT", # Botoşani
      "BV", # Braşov
      "BR", # Brăila
      "BZ", # Buzău
      "CS", # Caraş-Severin
      "CL", # Călăraşi
      "CJ", # Cluj
      "CT", # Constanţa
      "CV", # Covasna
      "DB", # Dâmboviţa
      "DJ", # Dolj
      "GL", # Galaţi
      "GR", # Giurgiu
      "GJ", # Gorj
      "HR", # Harghita
      "HD", # Hunedoara
      "IL", # Ialomiţa
      "IS", # Iaşi
      "MM", # Maramureş
      "MH", # Mehedinţi
      "MS", # Mureş
      "NT", # Neamţ
      "OT", # Olt
      "PH", # Prahova
      "SM", # Satu Mare
      "SJ", # Sălaj
      "SB", # Sibiu
      "SV", # Suceava
      "TR", # Teleorman
      "TM", # Timiş
      "TL", # Tulcea
      "VS", # Vaslui
      "VL", # Vâlcea
      "VN", # Vrancea
      # Russian Federation
      "AD", # Adygeya, Respublika
      "AL", # Altay, Respublika
      "BA", # Bashkortostan, Respublika
      "BU", # Buryatiya, Respublika
      "CE", # Chechenskaya Respublika
      "CU", # Chuvashskaya Respublika
      "DA", # Dagestan, Respublika
      "IN", # Ingushskaya Respublika
      "KB", # Kabardino-Balkarskaya Respublika
      "KL", # Kalmykiya, Respublika
      "KC", # Karachayevo-Cherkesskaya Respublika
      "KR", # Kareliya, Respublika
      "KK", # Khakasiya, Respublika
      "KO", # Komi, Respublika
      "ME", # Mariy El, Respublika
      "MO", # Mordoviya, Respublika
      "SA", # Sakha, Respublika [Yakutiya]
      "SE", # Severnaya Osetiya, Respublika [Alaniya]
      "TA", # Tatarstan, Respublika
      "TY", # Tyva, Respublika [Tuva]
      "UD", # Udmurtskaya Respublika
      "ALT", # Altayskiy kray
      "KHA", # Khabarovskiy kray
      "KDA", # Krasnodarskiy kray
      "KYA", # Krasnoyarskiy kray
      "PRI", # Primorskiy kray
      "STA", # Stavropol 'skiy kray
      "AMU", # Amurskaya Oblast'
      "ARK", # Arkhangel'skaya Oblast'
      "AST", # Astrakhanskaya Oblast'
      "BEL", # Belgorodskaya Oblast'
      "BRY", # Bryanskaya Oblast'
      "CHE", # Chelyabinskaya Oblast'
      "CHI", # Chitinskaya Oblast'
      "IRK", # Irkutskaya Oblast'
      "IVA", # Ivanovskaya Oblast'
      "KGD", # Kaliningradskaya Oblast'
      "KLU", # Kaluzhskaya Oblast'
      "KAM", # Kamchatskaya Oblast'
      "KEM", # Kemerovskaya Oblast'
      "KIR", # Kirovskaya Oblast'
      "KOS", # Kostromskaya Oblast'
      "KGN", # Kurganskaya Oblast'
      "KRS", # Kurskaya Oblast'
      "LEN", # Leningradskaya Oblast'
      "LIP", # Lipetskaya Oblast'
      "MAG", # Magadanskaya Oblast'
      "MOS", # Moskovskaya Oblast'
      "MUR", # Murmanskaya Oblast'
      "NIZ", # Nizhegorodskaya Oblast'
      "NGR", # Novgorodskaya Oblast'
      "NVS", # Novosibirskaya Oblast'
      "OMS", # Omskaya Oblast'
      "ORE", # Orenburgskaya Oblast'
      "ORL", # Orlovskaya Oblast'
      "PNZ", # Penzenskaya Oblast'
      "PER", # Permskaya Oblast'
      "PSK", # Pskovskaya Oblast'
      "ROS", # Rostovskaya Oblast'
      "RYA", # Ryazanskaya Oblast'
      "SAK", # Sakhalinskaya Oblast'
      "SAM", # Samarskaya Oblast’
      "SAR", # Saratovskaya Oblast'
      "SMO", # Smolenskaya Oblast'
      "SVE", # Sverdlovskaya Oblast'
      "TAM", # Tambovskaya Oblast'
      "TOM", # Tomskaya Oblast’
      "TUL", # Tul'skaya Oblast'
      "TVE", # Tverskaya Oblast'
      "TYU", # Tyumenskaya Oblast'
      "ULY", # Ul'yanovskaya Oblast'
      "VLA", # Vladimirskaya Oblast'
      "VGG", # Volgogradskaya Oblast'
      "VLG", # Vologodskaya Oblast'
      "VOR", # Voronezhskaya Oblast'
      "YAR", # Yaroslavskaya Oblast'
      "MOW", # Moskva
      "SPE", # Sankt-Peterburg
      "YEV", # Yevreyskaya avtonomnaya oblast'
      "AGB", # Aginskiy Buryatskiy avtonomnyy okrug
      "CHU", # Chukotskiy avtonomnyy okrug
      "EVE", # Evenkiyskiy avtonomnyy okrug
      "KHM", # Khanty-Mansiyskiy avtonomnyy okrug
      "KOP", # Komi-Permyatskiy avtonomnyy okrug
      "KOR", # Koryakskiy avtonomnyy okrug
      "NEN", # Nenetskiy avtonomnyy okrug
      "TAY", # Taymyrskiy (Dolgano-Nenetskiy) avtonomnyy okrug
      "UOB", # Ust’-Ordynskiy Buryatskiy avtonomnyy okrug
      "YAN", # Yamalo-Nenetskiy avtonomnyy okrug
      # Rwanda
      "C", # Butare
      "I", # Byumba
      "E", # Cyangugu
      "D", # Gikongoro
      "G", # Gisenyi
      "B", # Gitarama
      "J", # Kibungo
      "F", # Kibuye
      "K", # Kigali-Rural (Kigali y’ Icyaro)
      "L", # Kigali-Ville (Kilgali Ngari)
      "M", # Mutara
      "H", # Ruhengeri
      # St. Helena
      "SH", # Saint Helena
      "AC", # Ascension
      "TA", # Tristan da Cunha
      # Saint Kitts & Nevis
      "KN", # Saint Kitts & Nevis
      # Saint Lucia
      "LC", # Saint Lucia
      # St. Pierre & Miquelon
      "PM", # St. Pierre & Miquelon
      # St. Vincent & the Grenadines
      "VC", # St. Vincent & the Grenadines
      # Samoa
      "AA", # A'ana
      "AL", # Aiga-i-le-Tai
      "AT", # Atua
      "FA", # Fa'asaleleaga
      "GE", # Gaga'emauga
      "GI", # Gagaifomauga
      "PA", # Palauli
      "SA", # Satupa'itea
      "TU", # Tuamasaga
      "VF", # Va'a-o-Fonoti
      "VS", # Vaisigano
      # San Marino
      "SM", # San Marino
      # Sao Tome & Principe
      "P", # Príncipe
      "S", # Sāo Tomé
      # Saudi Arabia
      "11", # Al Bāḩah
      "08", # Al Ḩudūd ash Shamālīyah
      "12", # Al Jawf
      "03", # Al Madīnah
      "05", # Al Qaşim
      "O1", # Ar Riyāḑ
      "04", # Ash Sharqīyah
      "14", # ‘Asīr
      "06", # Ḩā'il
      "09", # Jīzān
      "02", # Makkah
      "10", # Najrān
      "07", # Tabūk
      # Senegal
      "DK", # Dakar
      "DB", # Diourbel
      "FK", # Fatick
      "KL", # Kaolack
      "KD", # Kolda
      "LG", # Louga
      "SL", # Saint-Louis
      "TC", # Tambacounda
      "TH", # Thiès
      "ZG", # Ziguinchor
      # Seychelles
      "SC", # Seychelles
      # Sierra Leone
      "W", # Western Area (Freetown)
      "E", # Eastern
      "N", # Northern
      "S", # Southern
      # Singapore
      "SG", # Singapore
      # Slovak Republic
      "BC", # Banskobystrický kraj
      "BL", # Bratislavský kraj
      "KI", # Košický kraj
      "NI", # Nitriansky kraj
      "PV", # Prešovský kraj
      "TC", # Trenčiansky kraj
      "TA", # Trnavský kraj
      "ZI", # Žilinský kraj
      # Slovenia
      "07", # Dolenjska
      "09", # Gorenjska
      "11", # Goriška
      "03", # Koroška
      "10", # Notranjsko-kraška
      "12", # Obalno-kraška
      "08", # Osrednjeslovenska
      "02", # Podravska
      "01", # Pomurska
      "04", # Savinjska
      "06", # Spodnjeposavska
      "05", # Zasavska
      # Solomon Islands
      "CT", # Capital Territory (Honiara)
      "CE", # Central
      "GU", # Guadalcanal
      "IS", # Isabel
      "MK", # Makira
      "ML", # Malaita
      "TE", # Temotu
      "WE", # Western
      # Somalia
      "AW", # Awdal
      "BK", # Bakool
      "BN", # Banaadir
      "BR", # Bari
      "BY", # BaY
      "GA", # Galguduud
      "GE", # Gedo
      "HI", # Hiiraan
      "JD", # Jubbada Dhexe
      "JH", # Jubbada Hoose
      "MU", # Mudug
      "NU", # Nugaal
      "SA", # Sanaag
      "SD", # Shabeellaha Dhexe
      "SH", # Shabeellaha Hoose
      "SO", # Sool
      "TO", # Togdheer
      "WO", # Woqooyi Galbeed
      # South Africa
      "EC", # Eastern Cape (Oos-Kaap)
      "FS", # Free State (Vrystaat)
      "GT", # Gauteng
      "NL", # Kwazulu-Natal
      "MP", # Mpumalanga
      "NC", # Northern Cape (Noord-Kaap)
      "NP", # Northern Province (Noordelike Provinsie)
      "NW", # North-West (Noord-Wes)
      "WC", # Western Cape (Wes-Kaap)
      # S.Georgia & S.Sandwich Islands
      "GS", # S.Georgia & S.Sandwich Islands
      # Spain
      "AN", # Andalucía
      "AL", # Almería
      "CA", # Cádiz
      "CO", # Córdoba
      "GR", # Granada
      "H", # Huelva
      "J", # Jaén
      "MA", # Málaga
      "SE", # Sevilla
      "AR", # Aragón
      "HU", # Huesca
      "TE", # Teruel
      "Z", # Zaragoza
      "O", # Asturias
      "CN", # Canarias
      "GC", # Las Palmas
      "TF", # Santa Cruz De Tenerife
      "S", # Cantabria
      "CM", # Castilla-La Mancha
      "AB", # Albacete
      "CR", # Ciudad Real
      "CU", # Cuenca
      "GU", # Guadalajara
      "TO", # Toledo
      "CL", # Castilla y León
      "AV", # Ávila
      "BU", # Burgos
      "LE", # León
      "P", # Palencia
      "SA", # Salamanca
      "SG", # Segovia
      "SO", # Soria
      "VA", # Valladolid
      "ZA", # Zamora
      "CT", # Cataluña
      "B", # Barcelona
      "GE", # Gerona
      "L", # Lérida
      "T", # Tarragona
      "EX", # Extremadura
      "BA", # Badajoz
      "CC", # Cáceres
      "GA", # Galicia
      "C", # La Coruña
      "LU", # Lugo
      "OR", # Orense
      "PO", # Pontevedra
      "PM", # Baleares
      "LO", # La Rioja
      "M", # Madrid
      "MU", # Murcia
      "NA", # Navarra
      "PV", # País Vasco
      "VI", # Álava
      "SS", # Guipúzcoa
      "BI", # Vizcaya
      "VC", # Valenciana, Comunidad
      "A", # Alicante
      "CS", # Castellón
      "V", # Valencia
      # Sri Lanka
      "1", # Basnahira Palata (Western Province)
      "11", # Colombo
      "12", # Gampaha
      "13", # Kalutara
      "3", # Dakunu Palata (Southern Province)
      "31", # Galle
      "33", # Hambantota
      "32", # Matara
      "2", # Madhyama Palata (Central Province)
      "21", # Kandy
      "22", # Matale
      "23", # Nuwara Eliya
      "5", # Negenahira Palata (Eastern Province)
      "52", # Arnpara
      "51", # Batticaloa
      "53", # Trincomalee
      "9", # Sabaragamuwa Palata
      "92", # Kegalla
      "91", # Ratnapura
      "7", # Uturumeda Palata (North Central Province)
      "71", # Anuradhapura
      "72", # Polonnaruwa
      "4", # Uturu Palata (Northern Province)
      "41", # Jaffna
      "42", # Kilinochchi
      "43", # Mannar
      "45", # Mullaittivu
      "44", # Vavuniya
      "8", # Uva Palata
      "81", # Badulla
      "82", # Monaragala
      "6", # Wayamba Palata (North Western Province)
      "61", # Kurunegala
      "62", # Puttalam
      # Sudan
      "23", # A‘ālī an Nīl
      "26", # Al Baḩr al Aḩmar
      "18", # Al Buḩayrāt
      "07", # Al Jazīrah
      "03", # Al Kharţūm
      "06", # Al Qaḑārif
      "22", # Al Waḩdah
      "04", # An Nīl
      "08", # An Nīl al Abyaḑ
      "24", # An Nīl al Azraq
      "01", # Ash Shamālīyah
      "17", # Baḩr al Jabal
      "16", # Gharb al Istiwā'īyah
      "14", # Gharb Baḩr al Ghazāl
      "12", # Gharb Dārfūr
      "10", # Gharb Kurdufān
      "11", # Janūb Dārfūr
      "13", # Janūb Kurdufān
      "20", # Jūnqalī
      "05", # Kassalā
      "15", # Shamāl Baḩr al Ghazāl
      "02", # Shamāl Dārfūr
      "09", # Shamāl Kurdufān
      "19", # Sharq al Istiwā'iyah
      "25", # Sinnār
      "21", # Wārāb
      # Suriname
      "BR", # Brokopondo
      "CM", # Commewijne
      "CR", # Coronie
      "MA", # Marowijne
      "NI", # Nickerie
      "PR", # Para
      "PM", # Paramaribo
      "SA", # Saramacca
      "SI", # Sipaliwini
      "WA", # Wanica
      # Svalbard & Jan Mayen Islands
      "SJ", # Svalbard & Jan Mayen Islands
      # Swaziland
      "HH", # Hhohho
      "LU", # Lubombo
      "MA", # Manzini
      "SH", # Shiselweni
      # Sweden
      "K", # Blekinge län
      "W", # Dalarnas län
      "I", # Gotlands län
      "X", # Gävleborgs län
      "N", # Hallands län
      "Z", # Jämtlands län
      "F", # Jönköpings län
      "H", # Kalmar län
      "G", # Kronobergs län
      "BD", # Norrbottens län
      "M", # Skåne län
      "AB", # Stockholms län
      "D", # Södermanlands län
      "C", # Uppsala län
      "S", # Värmlands län
      "AC", # Västerbottens län
      "Y", # Västernorrlands län
      "U", # Västmanlands län
      "O", # Västra Götalands län
      "T", # Örebro län
      "E", # Östergötlands län
      # Switzerland
      "AG", # Aargau
      "AR", # Appenzell Ausser-Rhoden
      "AI", # Appenzell Inner-Rhoden
      "BL", # Basel-Landschaft
      "BS", # Basel-Stadt
      "BE", # Bern
      "FR", # Freiburg
      "GE", # Geneve
      "GL", # Glarus
      "GR", # Graubünden
      "JU", # Jura
      "LU", # Luzern
      "NE", # Neuchatel
      "NW", # Nidwalden
      "OW", # Obwalden
      "SG", # Sankt Gallen
      "SH", # Schaffhausen
      "SZ", # Schwyz
      "SO", # Solothurn
      "TG", # Thurgau
      "TI", # Ticino
      "UR", # Uri
      "VS", # Wallis
      "VD", # Vaud
      "ZG", # Zug
      "ZH", # Zürich
      # Syria
      "HA", # Al Ḩasakah
      "LA", # Al Lādhiqīyah
      "QU", # Al Qunayţirah
      "RA", # Ar Raqqah
      "SU", # As Suwaydā'
      "DR", # Dar’ā
      "DY", # Dayr az Zawr
      "DI", # Dimashq
      "HL", # Ḩalab
      "HM", # Ḩamāh
      "HI", # Ḩimş
      "ID", # Idlib
      "RD", # Rīf Dimashq
      "TA", # Ţarţūs
      # Taiwan
      "KHH", # Kaohsiung
      "TPE", # Taipei
      "CYI", # Chiayi
      "HSZ", # Hsinchu
      "KEE", # Keelung
      "TXG", # Taichung
      "TNN", # Tainan
      "CHA", # Changhua
      "HUA", # Hualien
      "ILA", # Ilan
      "MIA", # Miaoli
      "NAN", # Nantou
      "PEN", # Penghu
      "PIF", # Pingtung
      "TTT", # Taitung
      "TAO", # Taoyuan
      "YUN", # Yunlin
      # Tajikistan
      "KR", # Karategin
      "KT", # Khatlon
      "LN", # Leninabad
      "GB", # Gorno-Badakhshan
      # Tanzania
      "01", # Arusha
      "02", # Dar-es-Salaam
      "03", # Dodoma
      "04", # Iringa
      "05", # Kagera
      "06", # Kaskazini Pemba (Pemba North)
      "07", # Kaskazini Unguja (Zanzibar North)
      "08", # Kigoma
      "09", # Kilimanjaro
      "10", # Kusini Pemba (Pemba South)
      "11", # Kusini Unguja (Zanzibar South)
      "12", # Lindi
      "13", # Mara
      "14", # Mbeya
      "15", # Mjini Magharibi (Zanzibar West)
      "16", # Morogoro
      "17", # Mtwara
      "18", # Mwanza
      "19", # Pwani (Coast)
      "20", # Rukwa
      "21", # Ruvuma
      "22", # Shinyanga
      "23", # Singida
      "24", # Tabora
      "25", # Tanga
      # Thailand
      "10", # Krung Thep Maha Nakhon [Bangkok]
      "S", # Phatthaya
      "37", # Amnat Charoen
      "15", # Ang Thong
      "31", # Buri Ram
      "24", # Chachoengsao
      "18", # Chai Nat
      "36", # Chaiyaphum
      "22", # Chanthaburi
      "50", # Chiang Mai
      "57", # Chiang Rai
      "20", # Chon Buri
      "86", # Chumphon
      "46", # Kalasin
      "62", # Kamphaeng Phet
      "71", # Kanchanaburi
      "40", # Khon Kaen
      "81", # Krabi
      "52", # Lampang
      "51", # Lamphun
      "42", # Loei
      "16", # Lop Buri
      "58", # Mae Hong Son
      "44", # Maha Sarakham
      "49", # Mukdahan
      "26", # Nakhon Nayok
      "73", # Nakhon Pathom
      "48", # Nakhon Phanom
      "30", # Nakhon Ratchasima
      "60", # Nakhon Sawan
      "80", # Nakhon Si Thammarat
      "55", # Nan
      "96", # Narathiwat
      "39", # Nong Bua Lam Phu
      "43", # Nong Khai
      "12", # Nonthaburi
      "13", # Pathum Thani
      "94", # Pattani
      "82", # Phangnga
      "93", # Phatthalung
      "56", # Phayao
      "67", # Phetchabun
      "76", # Phetchaburi
      "66", # Phichit
      "65", # Phitsanulok
      "54", # Phrae
      "14", # Phra Nakhon Si Ayutthaya
      "83", # Phuket
      "25", # Prachin Buri
      "77", # Prachuap Khiri Khan
      "85", # Ranong
      "70", # Ratchaburi
      "21", # Rayong
      "45", # Roi Et
      "27", # Sa Kaeo
      "47", # Sakon Nakhon
      "11", # Samut Prakan
      "74", # Samut Sakhon
      "75", # Samut Songkhram
      "19", # Saraburi
      "91", # Satun
      "17", # Sing Buri
      "33", # Si Sa Ket
      "90", # Songkhla
      "64", # Sukhothai
      "72", # Suphan Buri
      "84", # Surat Thani
      "32", # Surin
      "63", # Tak
      "92", # Trang
      "23", # Trat
      "34", # Ubon Ratchathani
      "41", # Udon Thani
      "61", # Uthai Thani
      "53", # Uttaradit
      "95", # Yala
      "35", # Yasothon
      # Togo
      "C", # Centre
      "K", # Kara
      "M", # Maritime (Région)
      "P", # Plateaux
      "S", # Savannes
      # Tokelau
      "TK", # Tokelau
      # Tonga
      "TO", # Tonga
      # Trinidad & Tobago
      "CTT", # Couva-Tabaquite-Talparo
      "DMN", # Diego Martin
      "ETO", # Eastern Tobago
      "PED", # Penal-Debe
      "PRT", # Princes Town
      "RCM", # Rio Claro-Mayaro
      "SGE", # Sangre Grande
      "SJL", # San Juan-Laventille
      "SIP", # Siparia
      "TUP", # Tunapuna-Piarco
      "WTO", # Western Tobago
      "ARI", # Arima
      "CHA", # Chaguanas
      "PTF", # Point Fortin
      "POS", # Port of Spain
      "SFO", # San Fernando
      # Tunisia
      "31", # Béja
      "13", # Ben Arous
      "23", # Bizerte
      "81", # Gabès
      "71", # Gafsa
      "32", # Jendouba
      "41", # Kairouan
      "42", # Kasserine
      "73", # Kebili
      "12", # L'Ariana
      "33", # Le Kef
      "53", # Mahdia
      "82", # Medenine
      "52", # Monastir
      "21", # Nabeul
      "61", # Sfax
      "43", # Sidi Bouzid
      "34", # Siliana
      "51", # Sousse
      "83", # Tataouine
      "72", # Tozeur
      "11", # Tunis
      "22", # Zaghouan
      # Turkey
      "01", # Adana
      "02", # Adiyaman
      "03", # Afyon
      "04", # Ağrı
      "68", # Aksaray
      "05", # Amasya
      "06", # Ankara
      "07", # Antalya
      "75", # Ardahan
      "08", # Artvin
      "09", # Aydin
      "10", # Balıkesir
      "74", # Bartın
      "72", # Batman
      "69", # Bayburt
      "11", # Bilecik
      "12", # Bingöl
      "13", # Bitlis
      "14", # Bolu
      "15", # Burdur
      "16", # Bursa
      "17", # Çanakkale
      "18", # Çankırı
      "19", # Çorum
      "20", # Denizli
      "21", # Diyarbakır
      "22", # Edirne
      "23", # Elaziğ
      "24", # Erzincan
      "25", # Erzurum
      "26", # Eskişehir
      "27", # Gaziantep
      "28", # Giresun
      "29", # Gümüşhane
      "30", # Hakkari
      "31", # Hatay
      "76", # Iğdir
      "32", # Isparta
      "33", # İçel
      "34", # İstanbul
      "35", # İzmir
      "46", # Kahramanmaraş
      "78", # Karabük
      "70", # Karaman
      "36", # Kars
      "37", # Kastamonu
      "38", # Kayseri
      "71", # Kırıkkale
      "39", # Kırklareli
      "40", # Kırşehir
      "79", # Kilis
      "41", # Kocaeli
      "42", # Konya
      "43", # Kütahya
      "44", # Malatya
      "4S", # Manisa
      "47", # Mardin
      "48", # Muğla
      "49", # Muş
      "SO", # Nevşehir
      "51", # Niğde
      "52", # Ordu
      "53", # Rize
      "54", # Sakarya
      "SS", # Samsun
      "56", # Siirt
      "57", # Sinop
      "S8", # Sivas
      "63", # Şanlıurfa
      "73", # Şirnak
      "59", # Tekirdağ
      "60", # Tokat
      "61", # Trabzon
      "62", # Tunceli
      "64", # Uşak
      "65", # Van
      "77", # Yalova
      "66", # Yozgat
      "67", # Zonguldak
      # Turkmenistan
      "A", # Ahal
      "B", # Balkan
      "D", # Daşhowuz
      "L", # Lebap
      "M", # Mary
      # Turks & Caicos Islands
      "TC", # Turks & Caicos Islands
      # Tuvalu
      "TV", # Tuvalu
      # Uganda
      "APA", # Apac
      "ARU", # Arua
      "BUN", # Bundibugyo
      "BUS", # Bushenyi
      "GUL", # Gulu
      "HOI", # Hoima
      "IGA", # Iganga
      "JIN", # Jinja
      "KBL", # Kabale
      "KBR", # Kabarole
      "KLG", # Kalangala
      "KLA", # Kampala
      "KLI", # Kamuli
      "KAP", # Kapchorwa
      "KAS", # Kasese
      "KLE", # Kibaale
      "KIB", # Kiboga
      "KIS", # Kisoro
      "KIT", # Kitgum
      "KOT", # Kotido
      "KUM", # Kumi
      "LIR", # Lira
      "LUW", # Luwero
      "MSK", # Masaka
      "MSI", # Masindi
      "MBL", # Mbale
      "MBR", # Mbarara
      "MOR", # Moroto
      "MOY", # Moyo
      "MPI", # Mpigi
      "MUB", # Mubende
      "MUK", # Mukono
      "NEB", # Nebbi
      "NTU", # Ntungamo
      "PAL", # Pallisa
      "RAK", # Rakai
      "RUK", # Rukungiri
      "SOR", # Soroti
      "TOR", # Tororo
      # Ukraine
      "71", # Cherkas'ka Oblast'
      "74", # Chernihivs'ka Oblast'
      "77", # Chernivets'ka Oblast'
      "12", # Dnipropetrovs'ka Oblast'
      "14", # Donets'ka Oblast'
      "26", # Ivano-Frankivs'ka Oblast'
      "63", # Kharkivs'ka Oblast'
      "65", # Khersons'ka Oblast'
      "68", # Khmel'nyts'ka Oblast'
      "35", # Kirovohrads'ka Oblast'
      "32", # Kyïvs'ka Oblast'
      "09", # Luhans'ka Oblast'
      "46", # L'vivs'ka Oblast'
      "48", # Mykolaïvs'ka Oblast'
      "51", # Odes'ka Oblast'
      "53", # Poltavs'ka Oblast'
      "56", # Rivnens'ka Oblast'
      "59", # Sums'ka Oblast'
      "61", # Ternopil's'ka Oblast'
      "05", # Vinnyts'ka Oblast'
      "07", # Volyns'ka Oblast'
      "21", # Zakarpats'ka Oblast'
      "23", # Zaporiz'ka Oblast'
      "18", # Zhytomyrs'ka Oblast'
      "43", # Respublika Krym
      "30", # Kyïv
      "40", # Sevastopol'
      # United Arab Emirates
      "AZ", # Abū Zaby (Abu Dhabi)
      "AJ", # ‘Ajmān
      "FU", # Al Fujayrah
      "SH", # Ash Shāriqah (Sharjah)
      "DU", # Dubayy (Dubai)
      "RK", # R'as al Khaymah
      "UQ", # Umm al Qaywayn
      # United States
      "AL", # Alabama
      "AK", # Alaska
      "AZ", # Arizona
      "AR", # Arkansas
      "CA", # California
      "CO", # Colorado
      "CT", # Connecticut
      "DE", # Delaware
      "FL", # Florida
      "GA", # Georgia
      "HI", # Hawaii
      "ID", # Idaho
      "IL", # Illinois
      "IN", # Indiana
      "IA", # Iowa
      "KS", # Kansas
      "KY", # Kentucky
      "LA", # Louisiana
      "ME", # Maine
      "MD", # Maryland
      "MA", # Massachusetts
      "MI", # Michigan
      "MN", # Minnesota
      "MS", # Mississippi
      "MO", # Missouri
      "MT", # Montana
      "NE", # Nebraska
      "NV", # Nevada
      "NH", # New Hampshire
      "NJ", # New Jersey
      "NM", # New Mexico
      "NY", # New York
      "NC", # North Carolina
      "ND", # North Dakota
      "OH", # Ohio
      "OK", # Oklahoma
      "OR", # Oregon
      "PA", # Pennsylvania
      "RI", # Rhode Island
      "SC", # South Carolina
      "SD", # South Dakota
      "TN", # Tennessee
      "TX", # Texas
      "UT", # Utah
      "VT", # Vermont
      "VA", # Virginia
      "WA", # Washington
      "WV", # West Virginia
      "WI", # Wisconsin
      "WY", # Wyoming
      "DC", # District of Columbia
      "AS", # American Samoa
      "GU", # Guam
      "MP", # Northern Mariana Islands
      "PR", # Puerto Rico
      "UM", # United States Minor Outlying Islands
      "VI", # Virgin Islands, U.S.
      # Uruguay
      "AR", # Artigas
      "CA", # Canelones
      "CL", # Cerro Largo
      "CO", # Colonia
      "DU", # Durazno
      "FS", # Flores
      "FD", # Florida
      "LA", # Lavalleja
      "MA", # Maldonado
      "MO", # Montevideo
      "PA", # Paysandú
      "RN", # Río Negro
      "RV", # Rivera
      "RO", # Rocha
      "SA", # Salto
      "SJ", # San José
      "SO", # Soriano
      "TA", # Tacuarembó
      "TT", # Treinta y Tres
      # Uzbekistan
      "QR", # Qoraqalpoghiston Respublikasi (Karakalpakstan, Respublika)
      "AN", # Andijon (Andizhan)
      "BU", # Bukhoro (Bukhara)
      "FA", # Farghona (Fergana)
      "JI", # Jizzakh (Dzhizak)
      "KH", # Khorazm (Khorezm)
      "NG", # Namangan
      "NW", # Nawoiy (Navoi)
      "QA", # Qashqadaryo (Kashkadar'ya)
      "SA", # Samarqand (Samarkand)
      "SI", # Sirdaryo (Syrdar'ya)
      "SU", # Surkhondaryo (Surkhandar'ya)
      "TO", # Toshkent (Tashkent)
      # Vanuatu
      "MAP", # Malampa
      "PAM", # Pénama
      "SAM", # Sanma
      "SEE", # Shéfa
      "TAE", # Taféa
      "TOB", # Torba
      # Venezuela
      "A", # Distrito Federal
      "B", # Anzoátegui
      "C", # Apure
      "D", # Aragua
      "E", # Barinas
      "F", # Bolívar
      "G", # Carabobo
      "H", # Cojedes
      "I", # Falcón
      "J", # Guárico
      "K", # Lara
      "L", # Mérida
      "M", # Miranda
      "N", # Monagas
      "O", # Nueva Esparta
      "P", # Portuguesa
      "R", # Sucre
      "S", # Táchira
      "T", # Trujillo
      "U", # Yaracuy
      "V", # Zulia
      "Z", # Amazonas
      "Y", # Delta Amacuro
      "W", # Dependencias Federales
      # Viet Nam
      "44", # An Giang
      "53", # Bat Can
      "54", # Bat Giang
      "55", # Bat Lieu
      "56", # Bat Ninh
      "43", # Ba Ria - Vung Tau
      "50", # Ben Tre
      "31", # Binh Dinh
      "57", # Binh Duong
      "58", # Binh Phuoc
      "40", # Binh Thuan
      "59", # Ca Mau
      "48", # Can Tho
      "04", # Cao Bang
      "33", # Dac Lac
      "60", # Da Nang, thanh pho
      "39", # Dong Nai
      "45", # Dong Thap
      "30", # Gia Lai
      "03", # Ha Giang
      "61", # Hai Duong
      "62", # Hai Phong, thanh pho
      "63", # Ha Nam
      "64", # Ha Noi, thu do
      "15", # Ha Tay
      "23", # Ha Tinh
      "14", # Hoa Binh
      "65", # Ho Chi Minh, thanh po [Sai Gon]
      "66", # Hung Yen
      "34", # Khanh Hoa
      "47", # Kien Giang
      "28", # Kon Turn
      "01", # Lai Chau
      "35", # Lam Dong
      "09", # Lang Son
      "02", # Lao Cai
      "41", # Long An
      "67", # Nam Dinh
      "22", # Nghe An
      "18", # Ninh Binh
      "36", # Ninh Thuan
      "68", # Phu Tho
      "32", # Phu Yen
      "24", # Quang Ninh
      "27", # Quang Nam
      "29", # Quang Ngai
      "25", # Quang Tri
      "52", # Sec Trang
      "05", # Son La
      "37", # Tay Ninh
      "20", # Thai Binh
      "69", # Thai Nguyen
      "21", # Thanh Hoa
      "26", # Thua Thien-Hue
      "46", # Tien Giang
      "51", # Tra Vinh
      "07", # Tuyen Quang
      "49", # Vinh Long
      "70", # Vinh Yen
      "06", # Yen Bai
      # Virgin Islands (British)
      "VG", # Virgin Islands (British)
      # Virgin Islands (U.S.)
      "VI", # Virgin Islands (U.S.)
      # Wallis & Futuna Islands
      "WF", # Wallis & Futuna Islands
      # Western Sahara
      "EH", # Western Sahara
      # Yemen
      "AB", # Abyān
      "AD", # ‘Adan
      "BA", # Al Bayḑā'
      "HU", # Al Ḩudaydah
      "JA", # Al Jawf
      "MR", # Al Mahrah
      "MW", # Al Maḩwit
      "DH", # Dhamār
      "HD", # Ḩaḑramawt
      "HJ", # Ḩajjah
      "IB", # Ibb
      "LA", # Laḩij
      "MA", # Ma'rib
      "SD", # Şa'dah
      "SN", # Şan‘ā'
      "SH", # Shabwah
      "TA", # Ta‘izz
      # Zambia
      "02", # Central
      "08", # Copperbelt
      "03", # Eastern
      "04", # Luapula
      "09", # Lusaka
      "05", # Northern
      "06", # North-Western
      "07", # Southern
      "01", # Western
      # Zimbabwe
      "BU", # Bulawayo
      "HA", # Harare
      "MA", # Manicaland
      "MC", # Mashonaland Central
      "ME", # Mashonaland East
      "MW", # Mashonaland West
      "MV", # Masvingo
      "MN", # Matabeleland North
      "MS", # Matabeleland South
      "MI", # Midlands
    ].uniq.freeze,
    T::Array[String]
  )
end
# rubocop:enable Metrics/ModuleLength
# rubocop:enable Style/AsciiComments