## ----echo = FALSE, message = FALSE---------------------------------------
hasData <- requireNamespace("hurricaneexposuredata", quietly=TRUE)
if (!hasData) {
    knitr::opts_chunk$set(eval = FALSE)
    print(paste("Note: Examples in this vignette require that the `hurricaneexposuredata` package",
                "be installed. The system currently running this vignette does not have that package",
                "installed, so code examples will not be evaluated."))
}

## ----echo = FALSE, message = FALSE, warning = FALSE----------------------
# If you need to, install the `hurricaneexposuredata` package from the drat repo:
# library(drat)
# addRepo("geanders")
# install.packages("hurricaneexposuredata")
library(hurricaneexposuredata)
library(hurricaneexposure)

## ----eval = FALSE--------------------------------------------------------
#  library(drat)
#  addRepo("geanders")
#  install.packages("hurricaneexposuredata")

## ------------------------------------------------------------------------
library(hurricaneexposuredata)
data("hurr_tracks")
head(hurr_tracks)

## ----echo = FALSE, message = FALSE, warning = FALSE----------------------
library(dplyr)
library(tidyr)
hurr_tracks %>%
        select(storm_id) %>%
        distinct() %>%
        separate(storm_id, into = c("storm_name", "Year"), sep = "-") %>%
        group_by(Year) %>%
        summarize(Storms = paste(storm_name, collapse = ", ")) %>%
        mutate(Distance = "x",
               Wind = "x",
               Rain = ifelse(Year <= 2011, "x", ""),
               Flood = ifelse(Year >= 1996, "x", ""),
               Tornado = "x") %>%
        pander::pander(justify = "clccccc")

## ----fig.width = 7, fig.height = 4---------------------------------------
map_counties(storm = "Floyd-1999", metric = "rainfall")

## ----fig.width = 7, fig.height = 4---------------------------------------
map_counties(storm = "Allison-2001", metric = "rainfall", days_included = -1:0) + 
        ggplot2::ggtitle("Rain during Allison (2001) for day before and day of closest approach")

## ----fig.width = 7, fig.height = 4---------------------------------------
map_counties(storm = "Allison-2001", metric = "rainfall", days_included = -5:3) + 
        ggplot2::ggtitle("Rain during Allison (2001) for five days before to three days\nafter the day of closest approach")

## ----fig.width = 7, fig.height = 4---------------------------------------
map_counties(storm = "Katrina-2005", metric = "wind")

## ----fig.width = 7, fig.height = 4---------------------------------------
map_counties("Katrina-2005", metric = "wind", wind_var = "sust_dur")

## ----fig.width = 7, fig.height = 4---------------------------------------
map_counties("Katrina-2005", metric = "wind", wind_source = "ext_tracks")

## ----fig.width = 7, fig.height = 4---------------------------------------
map_counties(storm = "Sandy-2012", metric = "distance")

## ----fig.width = 7, fig.height = 4---------------------------------------
map_distance_exposure(storm = "Sandy-2012", dist_limit = 75)

## ----fig.width = 7, fig.height = 4---------------------------------------
map_rain_exposure(storm = "Allison-2001", rain_limit = 175, dist_limit = 500,
                  days_included = -5:3)

## ----fig.width = 7, fig.height = 4---------------------------------------
map_wind_exposure(storm = "Katrina-2005", wind_limit = 20)

## ----fig.width = 7, fig.height = 4---------------------------------------
library(weathermetrics)
map_wind_exposure(storm = "Katrina-2005", 
                  wind_limit = convert_wind_speed(34, "knots", "mps"))

## ----fig.width = 7, fig.height = 4---------------------------------------
map_event_exposure(storm = "Floyd-1999", event_type = "flood")

## ----fig.width = 7, fig.height = 4---------------------------------------
map_event_exposure(storm = "Ivan-2004", event_type = "tornado")

## ----fig.width = 5.5, fig.height = 4-------------------------------------
map_tracks(storms = "Floyd-1999")

## ----fig.width = 5.5, fig.height = 4-------------------------------------
map_tracks(storms = c("Andrew-1992", "Katrina-2005", "Rita-2005"),
           alpha = 0.5, plot_points = TRUE, color = "blue")

## ----fig.width = 5.5, fig.height = 4-------------------------------------
library(dplyr)
library(tidyr)
storms_2005 <- hurr_tracks %>%
        select(storm_id) %>%
        distinct() %>%
        separate(storm_id, c("name", "year"), sep = "-", remove = FALSE) %>%
        filter(year == "2005")
map_tracks(storms = storms_2005$storm_id) 

## ----fig.width = 7, fig.height = 4---------------------------------------
floyd_map <- map_event_exposure(storm = "Floyd-1999", event_type = "flood")
map_tracks(storms = "Floyd-1999", plot_object = floyd_map, plot_points = TRUE, 
           color = "darkgray")

## ------------------------------------------------------------------------
county_rain(counties = c("22071", "51700"), start_year = 1995, end_year = 2005,
            rain_limit = 100, dist_limit = 100, days_included = c(-1, 0, 1))

## ------------------------------------------------------------------------
county_wind(counties = "12086", start_year = 1988, end_year = 2015, wind_limit = 17.5)

## ------------------------------------------------------------------------
county_wind(counties = "12086", start_year = 1988, end_year = 2015, 
            wind_var = "sust_dur", wind_limit = 60)

## ------------------------------------------------------------------------
county_wind(counties = "12086", start_year = 1988, end_year = 2015, 
            wind_var = "vmax_sust", wind_limit = 17.4, wind_source = "ext_tracks")

## ------------------------------------------------------------------------
county_distance(counties = "22071", start_year = 1988, end_year = 2015,
                dist_limit = 50)

## ------------------------------------------------------------------------
county_events(counties = "51710", start_year = 1996, end_year = 2015, 
              event_type = "flood")

## ----warning = FALSE-----------------------------------------------------
communities <- data.frame(commun = c(rep("ny", 6), "no", "new"),
                         fips = c("36005", "36047", "36061",
                                  "36085", "36081", "36119",
                                  "22071", "51700"))
multi_county_rain(communities = communities, start_year = 1995, end_year = 2005,
                   rain_limit = 100, dist_limit = 100)

