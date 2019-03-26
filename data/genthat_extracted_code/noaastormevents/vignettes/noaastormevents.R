## ----echo = FALSE--------------------------------------------------------
not_cran <- Sys.getenv("NOT_CRAN") == "true"
hasData <- requireNamespace("hurricaneexposuredata", quietly=TRUE)
if (!not_cran | !hasData) {
   knitr::opts_chunk$set(eval = FALSE)
    msg <- paste("Note: Examples in this vignette are set to not run on CRAN. If you would",
                 "like to build this vignette locally, you can do so by first setting the",
                 "environmental variable 'NOT_CRAN' to 'true' on your computer and then ",
                 "rebuilding the vignette.")
    msg <- paste(strwrap(msg), collapse="\n")
    message(msg)
}

## ---- echo = FALSE, message=FALSE, warning=FALSE-------------------------
library(noaastormevents)

## ----eval = FALSE--------------------------------------------------------
#  library(drat)
#  addRepo("geanders")
#  install.packages("hurricaneexposuredata")

## ------------------------------------------------------------------------
sept_1999_events <- find_events(date_range = c("1999-09-14", "1999-09-18"))
head(sept_1999_events)

## ------------------------------------------------------------------------
floyd_events <- find_events(storm = "Floyd-1999", dist_limit = 300)
head(floyd_events)

## ----echo = FALSE, message = FALSE, warning = FALSE----------------------
library(dplyr)
library(hurricaneexposuredata)
data("hurr_tracks")
hurr_tracks %>% 
  tidyr::separate(storm_id, c("storm", "year")) %>%
  dplyr::select(storm, year) %>%
  dplyr::distinct() %>%
  dplyr::group_by(year) %>% 
  dplyr::summarize(storms = paste(storm, collapse = ", ")) %>% 
  knitr::kable()

## ----message = FALSE, warning = FALSE------------------------------------
library(dplyr)
floyd_events %>%
  group_by(event_type) %>%
  summarize(n = n()) %>%
  arrange(desc(n)) %>%
  knitr::kable(col.names = c("Event type", "Number of events"),
               caption = "NOAA Storm Events within 200 km and within a 5-day window of Hurricane Floyd.")
  

## ------------------------------------------------------------------------
floyd_events %>%
  group_by(state, event_type) %>%
  summarize(n = n()) %>%
  ungroup() %>%
  arrange(state, desc(n)) %>%
  mutate(event_type = paste0(event_type, " (", n, ")")) %>%
  group_by(state) %>%
  summarize(Total = sum(n),
            Events = paste(event_type, collapse = ", ")) %>%
  ungroup() %>%
  arrange(desc(Total)) %>%
  knitr::kable()

## ----fig.width = 6, fig.height = 5---------------------------------------
event_data <- find_events(date_range = c("1999-09-14", "1999-09-18"))
map_events(event_data)

## ----fig.width = 6, fig.height = 5---------------------------------------
floyd_events <- find_events(storm = "Floyd-1999", dist_limit = 300) 
floyd_events %>% 
  map_events(states = "all")

## ----fig.width = 6, fig.height = 5---------------------------------------
floyd_events %>% 
  map_events(plot_type = "number of events",
             states = c("florida", "georgia", "south carolina", "north carolina",
                        "virginia", "maryland", "delaware", "pennsylvania",
                        "new jersey", "new york", "connecticut", "rhode island",
                        "massachusetts", "vermont", "new hampshire", "maine", 
                        "west virginia"))

## ----fig.width = 6, fig.height = 5---------------------------------------
floyd_events %>%   
  map_events(plot_type = "crop damage",
             states = c("north carolina", "virginia", "maryland"))

## ----fig.width = 6, fig.height = 5---------------------------------------
floyd_events %>% 
  map_events(plot_type = "property damage",
             states = c("florida", "georgia", "south carolina", "north carolina",
                        "virginia", "maryland", "delaware", "pennsylvania",
                        "new jersey", "new york", "connecticut", "rhode island",
                        "massachusetts", "vermont", "new hampshire", "maine", 
                        "west virginia"))

## ----fig.width = 6, fig.height = 5---------------------------------------
floyd_events %>%   
  map_events(plot_type = "crop damage",
             states = c("north carolina", "virginia", "maryland"),
             storm = "Floyd-1999", add_tracks = TRUE)

