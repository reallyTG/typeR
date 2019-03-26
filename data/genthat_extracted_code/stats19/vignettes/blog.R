## ---- eval=FALSE, message=FALSE------------------------------------------
#  install.packages("stats19")
#  # the dev version is used for this blog post
#  remotes::install_github("ropensci/stats19")

## ------------------------------------------------------------------------
library(stats19)

## ----dl2017-accidents, message=FALSE-------------------------------------
crashes_2017 = get_stats19(year = 2017, type = "Accidents", ask = FALSE)
nrow(crashes_2017)

## ----crashes_2017-explore------------------------------------------------
column_names = names(crashes_2017)
length(column_names)
head(column_names)
class(crashes_2017)
kableExtra::kable(head(crashes_2017[, c(1, 4, 5, 7, 10)]))

## ----file_names----------------------------------------------------------
stats19::file_names$dftRoadSafetyData_Vehicles_2017.zip

## ------------------------------------------------------------------------
crashes_2017_raw = get_stats19(year = 2017, type = "Accidents", ask = FALSE, format = FALSE)

## ----crashes_2017-raw----------------------------------------------------
kableExtra::kable(head(crashes_2017_raw[, c(1, 4, 5, 7, 10)]))

## ------------------------------------------------------------------------
class(crashes_2017$date)
class(crashes_2017_raw$Date)

## ----format-crashes-sf---------------------------------------------------
crashes_sf = format_sf(crashes_2017)
# crashes_sf = format_sf(crashes_2017, lonlat = TRUE) # provides the data in lon/lat format

## ----nfatalities, message=FALSE------------------------------------------
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
nrow(crashes_wy) # which is 3.36%

## ----dl2017-vehcas, message=FALSE----------------------------------------
#crashes_2017 = get_stats19(year = 2017, type = "Accidents", ask = FALSE)
casualties_2017 = get_stats19(year = 2017, type = "Casualties", ask = FALSE)
nrow(casualties_2017)
vehicles_2017 = get_stats19(year = 2017, type = "Vehicles", ask = FALSE)
nrow(vehicles_2017)

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

## ----sfplot, fig.show='hold', out.width="100%", fig.cap="Spatial distribution of serious and fatal crashes in West Yorkshire in 2017, for cycling, walking, being a car passenger and other modes of travel. Colour is related to the speed limit where the crash happened (red is faster) and size is proportional to the total number of people hurt in each crash.", fig.width=9, fig.height=7----
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

## ----crashes-map, fig.show='hold', out.width="100%", fig.cap="Spatial distribution of all crashes in 2017 in West Yorkshire.", fig.width=9, fig.height=7----
library(leaflet)
crashes_pedestrians = crashes_types %>% 
  filter(walking > 0)
# convert to lon lat CRS
crashes_pedestrians_lonlat = st_transform(crashes_pedestrians, crs = 4326)
pal = colorFactor(palette = "Reds", domain = crashes_pedestrians_lonlat$accident_severity, reverse = TRUE)
leaflet(data = crashes_pedestrians_lonlat, height = "280px") %>%
  addProviderTiles(provider = providers$OpenStreetMap.BlackAndWhite) %>%
  addCircleMarkers(radius = 0.5, color = ~pal(accident_severity)) %>% 
  addLegend(pal = pal, values = ~accident_severity) %>% 
  leaflet::addMiniMap()

