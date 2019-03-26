## ----echo = FALSE-------------------------------
options(width = 50, useFancyQuotes = FALSE, prompt = " ", continue = " ")

## ----eval = FALSE-------------------------------
#  install.packages("dbhydroR")

## ----eval = FALSE-------------------------------
#  devtools::install_github("ropensci/dbhydroR")

## ----message=FALSE------------------------------
library(dbhydroR)

## ----eval = FALSE-------------------------------
#  example(get_wq)

## ----eval = FALSE-------------------------------
#  get_wq(station_id = "FLAB08", date_min = "2011-03-01",
#        date_max = "2012-05-01", test_name = "CHLOROPHYLLA-SALINE")

## ----eval = FALSE-------------------------------
#  get_wq(station_id = c("FLAB08","FLAB09"), date_min = "2011-03-01",
#        date_max = "2012-05-01", test_name = "CHLOROPHYLLA-SALINE")

## ----eval = FALSE-------------------------------
#  get_wq(station_id = c("FLAB0%"), date_min = "2011-03-01",
#        date_max = "2012-05-01", test_name = "CHLOROPHYLLA-SALINE")

## ----eval = FALSE-------------------------------
#  get_wq(station_id = c("FLAB08","FLAB09"), date_min = "2011-03-01",
#        date_max = "2012-05-01", test_name = c("CHLOROPHYLLA-SALINE",
#        "SALINITY"))

## ----eval = FALSE-------------------------------
#  raw_wq <- get_wq(station_id = "FLAB08", date_min = "2011-03-01",
#        date_max = "2011-05-01", test_name = "CHLOROPHYLLA-SALINE",
#        raw = TRUE)

## ----eval = FALSE-------------------------------
#  clean_wq(raw_wq)

## ----eval = FALSE-------------------------------
#  get_dbkey(stationid = "JBTS", category = "WEATHER", param = "WNDS",
#           detail.level = "summary")

## ----eval = FALSE-------------------------------
#  get_dbkey(stationid = "JBTS", category = "WEATHER", param = "WNDS",
#           freq = "DA", detail.level = "full")

## ----eval = FALSE-------------------------------
#  get_dbkey(stationid = "JBTS", category = "WEATHER", param = "WNDS",
#           freq = "DA", stat = "MEAN", recorder = "CR10", agency = "WMD",
#           detail.level = "dbkey")

## ----eval = FALSE-------------------------------
#  get_hydro(dbkey = "15081",
#           date_min = "2013-01-01", date_max = "2013-02-02")

## ----eval = FALSE-------------------------------
#  get_hydro(date_min = "2013-01-01", date_max = "2013-02-02",
#           stationid = "JBTS", category = "WEATHER", param = "WNDS",
#           freq = "DA", stat = "MEAN", recorder = "CR10", agency = "WMD")

## ----eval = FALSE-------------------------------
#  get_hydro(dbkey = c("15081", "15069"), date_min = "2013-01-01",
#           date_max = "2013-02-02")

## ----eval = FALSE-------------------------------
#  get_hydro(date_min = "2013-01-01", date_max = "2013-02-02",
#           category = "WEATHER", stationid = c("JBTS", "MBTS"),
#           param = "WNDS", freq = "DA", stat = "MEAN")

## ----eval = FALSE-------------------------------
#  example(get_dbkey)
#  example(get_hydro)

## ----eval = FALSE-------------------------------
#  raw_data <- get_hydro(date_min = "2013-01-01", date_max = "2013-02-02",
#           stationid = "JBTS", category = "WEATHER", param = "WNDS",
#           freq = "DA", stat = "MEAN", recorder = "CR10", agency = "WMD", raw = TRUE)
#  
#  clean_hydro(raw_data)

