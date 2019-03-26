## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  out.width = "100%"
)

## ---- eval=FALSE---------------------------------------------------------
#  # from CRAN
#  install.packages("stats19")
#  # you can install the latest development (discoraged) using:
#  remotes::install_github("ITSLeeds/stats19")

## ------------------------------------------------------------------------
library(stats19)

## ----dl2017-accidents----------------------------------------------------
dl_stats19(year = 2017, type = "Accidents", ask = FALSE)

## ------------------------------------------------------------------------
stats19::file_names$dftRoadSafetyData_Vehicles_2017.zip

## ----dl2017-all, eval=FALSE----------------------------------------------
#  dl_stats19(year = 2017)

## ----dl2017-search-------------------------------------------------------
d17 = "dftRoadSafetyData_Accidents_2017"
dl_stats19(file_name = paste0(d17, ".zip"))

## ----dl2017-read---------------------------------------------------------
d17 = "dftRoadSafetyData_Accidents_2017"
dl_stats19(file_name = paste0(d17, ".zip"))
crashes_2017_raw = read_accidents(data_dir = tempdir(),
                                  year = 2017,
                                  filename = "Acc.csv")

## ----crashes2017-class---------------------------------------------------
class(crashes_2017_raw)
dim(crashes_2017_raw)

## ----read2017-raw-format-------------------------------------------------
crashes_2017_raw = read_accidents(year = 2017, format = FALSE)
crashes_2017 = format_accidents(crashes_2017_raw)
nrow(crashes_2017_raw)
ncol(crashes_2017_raw)
nrow(crashes_2017)
ncol(crashes_2017)

## ----crashes2017-columns-------------------------------------------------
crashes_2017_raw[c(7, 18, 23, 25)]
crashes_2017[c(7, 18, 23, 25)]

## ---- echo=FALSE, eval=FALSE---------------------------------------------
#  # commented out as confusing...
#  key_patt = "severity|speed|light|human"
#  key_vars = grep(key_patt, x = names(crashes_2017_raw), ignore.case = TRUE)
#  random_n = sample(x = nrow(crashes_2017_raw), size = 3)
#  crashes_2017_raw[random_n, key_vars]
#  crashes_2017[random_n, key_vars]

## ----variables-and-schema------------------------------------------------
stats19_variables
stats19_schema

## ----format-col-names----------------------------------------------------
format_column_names(stats19_variables$variable[1:3])

## ----format-main---------------------------------------------------------
crashes_2017 = format_accidents(crashes_2017_raw)

# vehicle data for 2017
dl_stats19(year = 2017, type = "vehicles", ask = FALSE)
vehicles_2017_raw = read_vehicles(year = 2017)
vehicles_2017 = format_vehicles(vehicles_2017_raw)

# casualties data for 2017
dl_stats19(year = 2017, type = "casualties", ask = FALSE)
casualties_2017 = read_casualties(year = 2017)

## ----summarise-stats19---------------------------------------------------
summarise_stats19 = function(x) {
  data.frame(row.names = 1:length(x),
    name = substr(names(x), 1, 19),
    class = sapply(x, class),
    n_unique = sapply(x, function(v) length(unique(v))),
    first_label = sapply(x, function(v) substr(unique(v)[1], 1, 9)),
    second_label = sapply(x, function(v) substr(unique(v)[2], 1, 9))
  )
}

## ----summarise-crashes---------------------------------------------------
knitr::kable(summarise_stats19(crashes_2017), 
             caption = "Summary of formatted crash data.")

## ----summarise-vehicles--------------------------------------------------
knitr::kable(summarise_stats19(vehicles_2017), 
             caption = "Summary of formatted vehicles data.")

## ----summarise-casualties------------------------------------------------
knitr::kable(summarise_stats19(casualties_2017), 
             caption = "Summary of formatted casualty data.")

## ---- echo=FALSE, results='asis'-----------------------------------------
key_patt = "severity|speed|light|human"
key_vars = grep(key_patt, x = names(stats19::accidents_sample_raw), ignore.case = TRUE)
knitr::kable(stats19::accidents_sample_raw[, key_vars])

## ----2017-cas------------------------------------------------------------
dl_stats19(year = 2017, type = "casualties", ask = FALSE)
casualties_2017 = read_casualties(year = 2017)
nrow(casualties_2017)
ncol(casualties_2017)

## ----2017-cas-columns----------------------------------------------------
casualties_2017[c(4, 5, 6, 14)]

## ----2017-cas-columns-all------------------------------------------------
names(casualties_2017)

## ----dl2017-vehicles-----------------------------------------------------
dl_stats19(year = 2017, type = "vehicles", ask = FALSE)
vehicles_2017 = read_vehicles(year = 2017)
nrow(vehicles_2017)
ncol(vehicles_2017)

## ----2017-veh-columns----------------------------------------------------
vehicles_2017[c(3, 14:16)]

## ----2017-veh-columns-all------------------------------------------------
names(vehicles_2017)

## ---- eval=FALSE, echo=FALSE---------------------------------------------
#  # old code to be up-dated
#  d14 = "Stats19_Data_2005-2014"
#  crashes_2005_2014 = read_accidents(data_dir = d14)
#  crashes_2005_2014_f = format_stats19_2005_2014_ac(crashes_2005_2014)
#  d15 = "RoadSafetyData_2015"
#  crashes_2015 = read_accidents(data_dir = d15, filename = "Accidents_2015.csv")
#  crashes_2015_f = format_stats19_2015_ac(crashes_2015)
#  d16 = "dftRoadSafety_Accidents_2016"
#  crashes_2016 = read_accidents(data_dir = d16, filename = "dftRoadSafety_Accidents_2016.csv")
#  crashes_2016_f = format_stats19_2016_ac(crashes_2016)
#  all_crashes = rbind(crashes_2015_f, crashes_2016_f, crashes_2017_f)
#  table(ac$Accident_Severity)

## ----format-crashes-sf---------------------------------------------------
crashes_sf = format_sf(crashes_2017)

## ----nfatalities---------------------------------------------------------
library(sf)
library(dplyr)
crashes_sf %>% 
  filter(accident_severity == "Fatal") %>% 
  select(n_fatalities = accident_index) %>% 
  aggregate(by = police_boundaries, FUN = length) %>% 
  plot()

## ----ukboundaries--------------------------------------------------------
west_yorkshire =
  police_boundaries[police_boundaries$pfa16nm == "West Yorkshire", ]

## ----crashes-west_yorkshire----------------------------------------------
crashes_wy = crashes_sf[west_yorkshire, ]
nrow(crashes_sf)
nrow(crashes_wy)

## ----table-join, message = FALSE-----------------------------------------
library(tidyr)
library(dplyr)
sel = casualties_2017$accident_index %in% crashes_wy$accident_index
casualties_wy = casualties_2017[sel, ]
cas_types = casualties_wy %>% 
  select(accident_index, casualty_type) %>% 
  group_by(accident_index) %>% 
  summarise(
    Total = n(),
    walking = sum(casualty_type == "Pedestrian"),
    cycling = sum(casualty_type == "Cyclist"),
    passenger = sum(casualty_type == "Car occupant")
    ) 
cj = left_join(crashes_wy, cas_types)

## ----table-join-examples-------------------------------------------------
base::setdiff(names(cj), names(crashes_wy))

## ---- out.width="90%", fig.show='hold'-----------------------------------
plot(
  cj[cj$cycling > 0, "speed_limit", ],
  cex = cj$Total[cj$cycling > 0] / 3,
  main = "Speed limit (cycling)"
  )
plot(
  cj[cj$passenger > 0, "speed_limit", ],
  cex = cj$Total[cj$passenger > 0] / 3,
  main = "Speed limit (passenger)"
  )

## ---- echo=FALSE---------------------------------------------------------
knitr::include_graphics("wy-overview.jpg")

## ----sfplot, fig.show='hold', out.width="100%", fig.cap="Spatial distribution of serious and fatal crashes in West Yorkshire, for cycling, walking, being a car passenger and other modes of travel. Colour is related to the speed limit where the crash happened (red is faster) and size is proportional to the total number of people hurt in each crash (legend not shown).", fig.width=9, fig.height=7----
library(ggplot2)
crashes_types = cj %>% 
  filter(accident_severity != "Slight") %>% 
  mutate(type = case_when(
    walking > 0 ~ "Walking",
    cycling > 0 ~ "Cycling",
    passenger > 0 ~ "Passenger",
    TRUE ~ "Other"
  ))
ggplot(crashes_types, aes(size = Total, colour = speed_limit)) +
  geom_sf(show.legend = "point", alpha = 0.3) +
  facet_grid(vars(type), vars(accident_severity)) +
  scale_size(
    breaks = c(1:3, 12),
    labels = c(1:2, "3+", 12)
    ) +
  scale_color_gradientn(colours = c("blue", "yellow", "red")) +
  theme(axis.text = element_blank(), axis.ticks = element_blank())

## ----ggplot-ped-severity, fig.height=5, fig.width=6----------------------
table(cj$light_conditions)
cj %>% 
  filter(walking > 0) %>% 
  mutate(light = case_when(
    light_conditions == "Daylight" ~ "Daylight",
    light_conditions == "Darkness - lights lit" ~ "Lit",
    TRUE ~ "Other/Unlit"
  )) %>% 
  ggplot(aes(colour = speed_limit)) +
  geom_sf() +
  facet_grid(vars(light), vars(accident_severity)) +
  scale_color_continuous(low = "blue", high = "red") +
  theme(axis.text = element_blank(), axis.ticks = element_blank())

## ----crash-date-plot, fig.width=5, fig.height=5--------------------------
crashes_dates = cj %>% 
  st_set_geometry(NULL) %>% 
  group_by(date) %>% 
  summarise(
    walking = sum(walking),
    cycling = sum(cycling),
    passenger = sum(passenger)
    ) %>% 
  gather(mode, casualties, -date)
ggplot(crashes_dates, aes(date, casualties)) +
  geom_smooth(aes(colour = mode), method = "loess") +
  ylab("Casualties per day")

## ----crash-time-plot, fig.width=5, fig.height=5--------------------------
library(stringr)

crash_times = cj %>% 
  st_set_geometry(NULL) %>% 
  group_by(hour = as.numeric(str_sub(time, 1, 2))) %>% 
  summarise(
    walking = sum(walking),
    cycling = sum(cycling),
    passenger = sum(passenger)
    ) %>% 
  gather(mode, casualties, -hour)

ggplot(crash_times, aes(hour, casualties)) +
  geom_line(aes(colour = mode))

