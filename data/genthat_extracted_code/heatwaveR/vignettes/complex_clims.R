## ----global_options, include = FALSE-------------------------------------
knitr::opts_chunk$set(fig.width = 8, fig.height = 3, fig.align = 'centre',
                      echo = TRUE, warning = FALSE, message = FALSE,
                      eval = TRUE, tidy = FALSE)

## ----load-libs-----------------------------------------------------------
library(tidyverse)
library(ggpubr)
library(heatwaveR)

# We will use this package to download atmospheric temperature data
# Era-interim would be ideal but as of this writing it is still not 
# possible to downloaded it natively in R
library(weathercan)

## ----data-prep, eval=T---------------------------------------------------
# If you'd like to see what stations aare available, run the following line of code:
# station_ID <- weathercan::stations_dl()

# Download Halifax Airport data
halifax_raw <- weather_dl(station_ids = c(6358, 50620), interval = "day", quiet = T)

# Prepare for analysis
halifax <- halifax_raw %>% 
  dplyr::select(date, min_temp, max_temp) %>% 
  dplyr::rename(t = date, tMin = min_temp, tMax = max_temp) %>% 
  dplyr::filter(t >= "1960-01-01") %>%
  na.omit()

## ----clim-calc-----------------------------------------------------------
# The tMax threshold
# The current WMO standard climatology period is 1981-01-01 to 2010-12-31 and should be used when possible
tMax_clim <- ts2clm(data = halifax, y = tMax, climatologyPeriod = c("1981-01-01", "2010-12-31"), pctile = 90)

# The tMin exceedance
# Note the use here of 'minDuration = 3' and 'maxGap = 1' as the default atmospheric arguments
# The default marine arguemnts are 'minDuration = 5' and 'maxGap = 2'
tMin_exc <- exceedance(data = halifax, y = tMin, threshold = 15, minDuration = 3, maxGap = 1)$threshold

## ----events--------------------------------------------------------------
# Note that because we calculated our 90th percentile threshold on a column named 'tMax' 
# and not the default column name 'temp', we must specify this below with 'y = tMax'
events <- detect_event(data = tMax_clim, y = tMax, # The 90th percentile threshold
                       threshClim2 = tMin_exc$exceedance) # The flat exceedance threshold

## ----visuals-------------------------------------------------------------
# don't forget to set 'event_line(y = tMax)'
ggarrange(event_line(events, y = tMax, metric = "intensity_max"),
          event_line(events, y = tMax, metric = "intensity_max", category = T),
          lolli_plot(events),
          ncol = 1, nrow = 3, align = "v")

## ----alt-two-thresh-calc-------------------------------------------------
# Note that because we are not using the standard column name 'temp' we must
# specify the chosen column name twice, once for ts2clm() and again for detect_event()

# First threshold based on tMin
thresh_tMin <- ts2clm(data = halifax, y = tMin, pctile = 80, 
                                climatologyPeriod = c("1981-01-01", "2010-12-31"))

# Second threshold based on tMax
# Be careful here that you put the arguments within the correct brackets
thresh_tMax <- detect_event(ts2clm(data = halifax, y = tMax, pctile = 90, 
                                   climatologyPeriod = c("1981-01-01", "2010-12-31")),
                         # These arguments are passed to detect_event()
                                minDuration = 3, maxGap = 0, y = tMax, protoEvents = T)

# Detect/calculate events using the two precalculated thresholds
# Because detect_event() is not able to deduce which arguments we used above,
# we must again tell it explicitly here
events_two_thresh <- detect_event(data = thresh_tMin, y = tMin, minDuration = 10, maxGap = 2,
                                  threshClim2 = thresh_tMax$event, minDuration2 = 3, maxGap2 = 0)

# Or to simply use one threshold
events_one_thresh <- detect_event(data = thresh_tMin, y = tMin, minDuration = 10, maxGap = 2)

## ----alt-two-thresh-lollis-----------------------------------------------
ggarrange(lolli_plot(events_one_thresh), lolli_plot(events_two_thresh), labels = c("One threshold", "Two thresholds"))

## ----alt-two-thresh-events-----------------------------------------------
head(events_one_thresh$event)
head(events_two_thresh$event)

## ----event-data-frame----------------------------------------------------
# Pull out each data.frame as there own object for easier use
events_one_event <- events_one_thresh$event
events_one_climatology <- events_one_thresh$climatology

## ----filter-join---------------------------------------------------------
# Join the two threshold dataframes
two_thresh <- left_join(events_one_climatology, thresh_tMax, by = c("t"))

# Remove all days that did not qualify as events in both thresholds
two_thresh_filtered <- two_thresh %>%
  filter(event.x == TRUE,
         event.y == TRUE)

## ----filter-one-thresh---------------------------------------------------
# Copy data with a new name
events_one_thresh_filtered <- events_one_thresh

# Then filter
events_one_thresh_filtered$event <- events_one_thresh_filtered$event %>% 
  filter(event_no %in% two_thresh_filtered$event_no.x)

# Compare results
head(events_one_thresh_filtered$event)
head(events_two_thresh$event)

## ----lolliplot-duration, fig.cap="Difference in duration (days) of events given different applications of thresholds. Note the difference in the y-axes."----
ggarrange(lolli_plot(events_two_thresh, metric = "duration"), 
          lolli_plot(events_one_thresh_filtered, metric = "duration"), 
          labels = c("Double threshold", "Filter threshold"))

## ----lolliplot-int-cum, fig.cap="Difference in cumulative intensity (°C x days) of events given different applications of thresholds. Note the difference in the y-axes."----
ggarrange(lolli_plot(events_two_thresh, metric = "intensity_cumulative"), 
          lolli_plot(events_one_thresh_filtered, metric = "intensity_cumulative"), 
          labels = c("Double threshold", "Filter threshold"))

