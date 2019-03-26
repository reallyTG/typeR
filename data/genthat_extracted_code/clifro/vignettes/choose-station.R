## ---- echo=FALSE---------------------------------------------------------
library(clifro)

## ---- eval = FALSE-------------------------------------------------------
#  # Equivalent to searching for status = "open" on CliFro
#  # Note the search string is not case sensitive
#  cf_find_station("takaka", status = "all")

## ---- echo = FALSE-------------------------------------------------------
takaka.df = structure(list(name = structure(c(9L, 11L, 13L, 5L, 3L, 8L, 12L, 
10L, 7L, 2L, 6L, 4L, 1L), .Label = c("Takaka", "Takaka Aero", 
"Takaka Aero Raws", "Takaka,Bu Bu", "Takaka Ews", "Takaka Hill", 
"Takaka,Kotinga 1", "Takaka, Kotinga 2", "Takaka, Kotinga Road", 
"Takaka,Patons Rock", "Takaka Pohara", "Upper Takaka", "Upper Takaka 2"
), class = "factor"), network = structure(c(5L, 7L, 12L, 8L, 
13L, 6L, 11L, 1L, 9L, 2L, 10L, 3L, 4L), .Label = c("F02772", 
"F02871", "F02872", "F02881", "F02882", "F02883", "F02884", "F02885", 
"F02971", "F12081", "F12082", "F12083", "O00957"), class = "factor"), 
    agent = c(3788, 3790, 11519, 23849, 41196, 3789, 7316, 3779, 
    3794, 3785, 3833, 3786, 3787), start = structure(c(18273600, 
    520516800, 805464000, 1020081600, 1439294400, 502110000, 
    688820400, -7992000, -255182400, -1046692800, -704894400, 
    -1159875000, -2082886200), class = c("POSIXct", "POSIXt"), tzone = "Pacific/Auckland"), 
    end = structure(c(1532433600, 1532433600, 1532433600, 1532433600, 
    1532433600, 1341057600, 720442800, 157719600, 49809600, 7732800, 
    -320932800, -760190400, -1333452600), class = c("POSIXct", 
    "POSIXt"), tzone = "Pacific/Auckland"), open = c(TRUE, TRUE, 
    TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, 
    FALSE, FALSE), distance = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0), lat = c(-40.872, -40.845, -41.01516, -40.86364, 
    -40.81531, -40.882, -41.051, -40.789, -40.9, -40.816, -41.017, 
    -40.85, -40.817), lon = c(172.809, 172.867, 172.82582, 172.80568, 
    172.7765, 172.801, 172.833, 172.757, 172.775, 172.772, 172.867, 
    172.733, 172.8)), class = "data.frame", row.names = c(NA, 
-13L))

new("cfStation", takaka.df)

## ---- eval = FALSE-------------------------------------------------------
#  cf_find_station("takaka", status = "open")

## ---- echo = FALSE-------------------------------------------------------
takaka.df = structure(list(name = structure(c(3L, 4L, 5L, 2L, 1L), .Label = c("Takaka Aero Raws", 
"Takaka Ews", "Takaka, Kotinga Road", "Takaka Pohara", "Upper Takaka 2"
), class = "factor"), network = structure(c(1L, 2L, 4L, 3L, 5L
), .Label = c("F02882", "F02884", "F02885", "F12083", "O00957"
), class = "factor"), agent = c(3788, 3790, 11519, 23849, 41196
), start = structure(c(18273600, 520516800, 805464000, 1020081600, 
1439294400), class = c("POSIXct", "POSIXt"), tzone = "Pacific/Auckland"), 
    end = structure(c(1532433600, 1532433600, 1532433600, 1532433600, 
    1532433600), class = c("POSIXct", "POSIXt"), tzone = "Pacific/Auckland"), 
    open = c(TRUE, TRUE, TRUE, TRUE, TRUE), distance = c(0, 0, 
    0, 0, 0), lat = c(-40.872, -40.845, -41.01516, -40.86364, 
    -40.81531), lon = c(172.809, 172.867, 172.82582, 172.80568, 
    172.7765)), class = "data.frame", row.names = c(NA, -5L))

new("cfStation", takaka.df)

## ---- eval = FALSE-------------------------------------------------------
#  cf_find_station("f028", search = "network", status = "all")

## ---- echo = FALSE-------------------------------------------------------
xx.df = structure(list(name = structure(c(11L, 12L, 9L, 10L, 4L, 3L, 
2L, 1L, 13L, 7L, 14L, 8L, 6L, 5L), .Label = c("Golden Bay,Table Hl 2", 
"Golden Bay,Table Hl I", "Gouland Downs", "Nelson,Mckay Hut", 
"Quartz Ranges", "Takaka", "Takaka Aero", "Takaka,Bu Bu", "Takaka Ews", 
"Takaka, Kotinga 2", "Takaka, Kotinga Road", "Takaka Pohara", 
"Tarakohe", "Totaranui"), class = "factor"), network = structure(c(9L, 
11L, 12L, 10L, 1L, 2L, 4L, 5L, 13L, 6L, 14L, 7L, 8L, 3L), .Label = c("F02821", 
"F02831", "F02851", "F02852", "F02853", "F02871", "F02872", "F02881", 
"F02882", "F02883", "F02884", "F02885", "F02891", "F02892"), class = "factor"), 
    agent = c(3788, 3790, 23849, 3789, 3780, 3781, 3783, 3784, 
    3791, 3785, 3792, 3786, 3787, 3782), start = structure(c(18273600, 
    520516800, 1020081600, 502110000, 417960000, 467982000, 233928000, 
    233928000, -1188819000, -1046692800, -410270400, -1159875000, 
    -2082886200, -2177494200), class = c("POSIXct", "POSIXt"), tzone = "Pacific/Auckland"), 
    end = structure(c(1532433600, 1532433600, 1532433600, 1341057600, 
    745416000, 745416000, 690807600, 690807600, 599569200, 7732800, 
    -294667200, -760190400, -1333452600, -2125049400), class = c("POSIXct", 
    "POSIXt"), tzone = "Pacific/Auckland"), open = c(TRUE, TRUE, 
    TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, 
    FALSE, FALSE, FALSE), distance = c(0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0), lat = c(-40.872, -40.845, -40.86364, -40.882, 
    -40.89, -40.892, -40.807, -40.807, -40.825, -40.816, -40.823, 
    -40.85, -40.817, -40.867), lon = c(172.809, 172.867, 172.80568, 
    172.801, 172.213, 172.351, 172.556, 172.556, 172.898, 172.772, 
    173.002, 172.733, 172.8, 172.517)), class = "data.frame", row.names = c(NA, 
-14L))

new("cfStation", xx.df)

## ---- echo = FALSE-------------------------------------------------------
open.queenstown.stations.df = dget(system.file("extdata", "queenStations", package = "clifro"))
open.queenstown.stations = new("cfStation", open.queenstown.stations.df)

## ---- eval = FALSE-------------------------------------------------------
#  # Partial match for the Queenstown region
#  open.queenstown.stations = cf_find_station("queen", search = "region")

## ---- echo = FALSE-------------------------------------------------------
takaka.town.df = structure(list(name = structure(c(3L, 4L, 2L, 1L), .Label = c("Takaka Aero Raws", 
"Takaka Ews", "Takaka, Kotinga Road", "Takaka Pohara"), class = "factor"), 
    network = structure(1:4, .Label = c("F02882", "F02884", "F02885", 
    "O00957"), class = "factor"), agent = c(3788, 3790, 23849, 
    41196), start = structure(c(18273600, 520516800, 1020081600, 
    1439294400), class = c("POSIXct", "POSIXt"), tzone = "Pacific/Auckland"), 
    end = structure(c(1532520000, 1532520000, 1532520000, 1532520000
    ), class = c("POSIXct", "POSIXt"), tzone = "Pacific/Auckland"), 
    open = c(TRUE, TRUE, TRUE, TRUE), distance = c(2.6, 5.7, 
    1.6, 4.3), lat = c(-40.872, -40.845, -40.86364, -40.81531
    ), lon = c(172.809, 172.867, 172.80568, 172.7765)), class = "data.frame", row.names = c(NA, 
-4L))
takaka.town.st = new("cfStation", takaka.town.df)

## ---- eval = FALSE-------------------------------------------------------
#  takaka.town.st = cf_find_station(lat = -40.85, long = 172.8, rad = 10, search = "latlong")
#  takaka.town.st[, -c(8, 9)]

## ---- echo = -1----------------------------------------------------------
takaka.town.st[, -c(8, 9)]

# We may rather order the stations by distance from the township
takaka.town.st[order(takaka.town.st$distance), -c(8, 9)]

## ---- echo = FALSE-------------------------------------------------------
hourly.rain.dt = new("cfDatatype"
    , dt_name = "Precipitation"
    , dt_type = "Rain (fixed periods)"
    , dt_sel_option_names = list("Hourly")
    , dt_sel_combo_name = NA_character_
    , dt_param = structure("ls_ra,1,2,3,4", .Names = "dt1")
    , dt_sel_option_params = list(structure("182", .Names = "prm2"))
    , dt_selected_options = list(2)
    , dt_option_length = 4
)

## ---- eval = FALSE-------------------------------------------------------
#  # Create a clifro datatype for hourly rain
#  hourly.rain.dt = cf_datatype(3, 1, 2)
#  hourly.rain.dt

## ---- echo = FALSE-------------------------------------------------------
hourly.rain.dt

## ---- eval = FALSE-------------------------------------------------------
#  # Conduct the search
#  cf_find_station("takaka", datatype = hourly.rain.dt)

## ---- echo = FALSE-------------------------------------------------------
kaitaia.df = structure(list(name = structure(c(4L, 10L, 9L, 3L, 8L, 1L, 6L, 
7L, 2L, 5L), .Label = c("Cape Reinga Aws", "Dargaville 2 Ews", 
"Kaikohe Aws", "Kaitaia Aero Ews", "Kaitaia Ews", "Kerikeri Aerodrome Aws", 
"Kerikeri Ews", "Purerua Aws", "Russell Cws", "Trounson Cws"), class = "factor"), 
    network = structure(c(2L, 7L, 10L, 6L, 9L, 1L, 5L, 4L, 8L, 
    3L), .Label = c("A42462", "A53026", "A53127", "A53191", "A53295", 
    "A53487", "A53762", "A53987", "A54101", "A54212"), class = "factor"), 
    agent = c(18183, 37131, 41262, 1134, 1196, 1002, 37258, 1056, 
    25119, 17067), start = structure(c(960984000, 1244030400, 
    1459771200, 500727600, 788871600, 788871600, 1214395200, 
    1025179200, 1067425200, 913806000), class = c("POSIXct", 
    "POSIXt"), tzone = "Pacific/Auckland"), end = structure(c(1532347200, 
    1532347200, 1532347200, 1532260800, 1532260800, 1532260800, 
    1532260800, 1531915200, 1531915200, 1531310400), class = c("POSIXct", 
    "POSIXt"), tzone = "Pacific/Auckland"), open = c(TRUE, TRUE, 
    TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE), distance = c(0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0), lat = c(-35.0677, -35.72035, 
    -35.26835, -35.4172, -35.129, -34.42963, -35.262, -35.183, 
    -35.93145, -35.135), lon = c(173.2874, 173.65153, 174.136, 
    173.8229, 174.015, 172.68186, 173.911, 173.926, 173.85317, 
    173.262)), class = "data.frame", row.names = c(NA, -10L))
kaitaia.st = new("cfStation", kaitaia.df)
my.composite.search = takaka.town.st + kaitaia.st

## ---- eval = FALSE-------------------------------------------------------
#  my.composite.search = takaka.town.st + cf_find_station("kaitaia",
#                                                         search = "region",
#                                                         datatype = hourly.rain.dt)
#  my.composite.search

## ---- echo = -1----------------------------------------------------------
my.composite.search

# How long have these stations been open for?
transform(my.composite.search, ndays = round(end - start))[, c(1, 10)]

## ---- echo = FALSE-------------------------------------------------------
all.auckland.df = dget(system.file("extdata", "auckStations", package = "clifro"))
all.auckland.st = new("cfStation", all.auckland.df)

## ----eval = FALSE--------------------------------------------------------
#  # First, search for the stations
#  all.auckland.st = cf_find_station("auckland", search = "region", status = "all")

## ----eval=FALSE----------------------------------------------------------
#  # Then save these as a KML
#  cf_save_kml(all.auckland.st, file_name = "all_auckland_stations")

