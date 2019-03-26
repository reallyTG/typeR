## ----setup, include = FALSE----------------------------------------------
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", 
  cache = FALSE
)

#knitr::opts_chunk$set(purl = NOT_CRAN)
library(nsapi)

## ---- eval=FALSE---------------------------------------------------------
#  Sys.setenv(NSAPIACCOUNT = "probablyyouremail@email.com")
#  Sys.setenv(NSAPIPW = "yourpasswordgiveninplaintextoveremailwhydopeopledothisohgod")

## ---- eval=FALSE---------------------------------------------------------
#  file.edit("~./.Renviron")

## ---- eval=NOT_CRAN------------------------------------------------------
check_ns_api_keys()

## ---- eval=NOT_CRAN------------------------------------------------------
library(nsapi)
ams_to_ut <- get_travel_advise(
  fromStation = "Amsterdam Centraal",
  toStation = "Utrecht Centraal",
  #dateTime = , # I don't use it because I want to leave now!
  departure = TRUE  # I want to depart now
)
ams_to_ut[,1:5]

## ---- eval=NOT_CRAN------------------------------------------------------
ams_to_ut[,6:8]

## ---- eval=NOT_CRAN------------------------------------------------------
str(ams_to_ut[1,13])

## ---- eval=NOT_CRAN------------------------------------------------------
ams_to_ut$ReisDeel[[1]]

## ---- eval=NOT_CRAN------------------------------------------------------
ams_to_ut$ReisDeel[[1]]$Stops[[1]]

## ---- eval=NOT_CRAN------------------------------------------------------
stations <- get_stationlist()
head(stations)
names(stations)

## ---- eval=FALSE---------------------------------------------------------
#  # code is not executed, I don't want to add these dependencies to the package
#  library(tidyverse)
#  library(ggrepel)
#  stations <-
#    get_stations() %>%
#    mutate(Naam = map_chr(Namen, ~.[["Kort"]][[1]]),
#    Label = ifelse(Type == "knooppuntIntercitystation", Naam,NA) ) %>%
#    as.tibble()
#  
#  stations %>%
#    filter(Land == "NL") %>%
#    ggplot(aes(Lon, Lat, label = Label))+
#    geom_point(alpha = 1/3)+
#    geom_text_repel()+
#    coord_map()+
#    labs(
#      title = "Only Dutch Stations",
#      subtitle = "Major stations named",
#      caption = "Data: NS 2018 (Dutch National Railways)"
#    )

## ---- eval=NOT_CRAN------------------------------------------------------
leiden_trains <- get_departures(station = "Leiden Lammenschans")
head(leiden_trains)


## ---- eval=NOT_CRAN------------------------------------------------------
current <- get_current_disruptions()
current[1:2, c("Traject", "Periode")] # I'll show a sample of the responses

## ---- eval=NOT_CRAN------------------------------------------------------
sched <- get_scheduled_engineering_work()
sched[2:4,c("Traject","Periode", "Advies")]

## ---- eval=NOT_CRAN------------------------------------------------------
get_disruptions_station(station = "Rotterdam Centraal")$Bericht[1:2]

