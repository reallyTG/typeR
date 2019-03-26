## ----setup, results='hide', message=FALSE, warning=FALSE-----------------
# required packages:
library(opensensmapr) # data download
library(dplyr)        # data wrangling
library(ggplot2)      # plotting
library(lubridate)    # date arithmetic
library(zoo)          # rollmean()

## ----download------------------------------------------------------------
# if you want to see results for a specific subset of boxes,
# just specify a filter such as grouptag='ifgi' here
boxes = osem_boxes()

## ----exposure_counts, message=FALSE--------------------------------------
exposure_counts = boxes %>%
  group_by(exposure) %>%
  mutate(count = row_number(createdAt))

exposure_colors = c(indoor = 'red', outdoor = 'lightgreen', mobile = 'blue', unknown = 'darkgrey')
ggplot(exposure_counts, aes(x = createdAt, y = count, colour = exposure)) +
  geom_line() +
  scale_colour_manual(values = exposure_colors) +
  xlab('Registration Date') + ylab('senseBox count')

## ----exposure_summary----------------------------------------------------
exposure_counts %>%
  summarise(
    oldest = min(createdAt),
    newest = max(createdAt),
    count = max(count)
  ) %>%
  arrange(desc(count))

## ----grouptag_counts, message=FALSE--------------------------------------
grouptag_counts = boxes %>%
  group_by(grouptag) %>%
  # only include grouptags with 8 or more members
  filter(length(grouptag) >= 8 && !is.na(grouptag)) %>%
  mutate(count = row_number(createdAt))

# helper for sorting the grouptags by boxcount
sortLvls = function(oldFactor, ascending = TRUE) {
  lvls = table(oldFactor) %>% sort(., decreasing = !ascending) %>% names()
  factor(oldFactor, levels = lvls)
}
grouptag_counts$grouptag = sortLvls(grouptag_counts$grouptag, ascending = FALSE)

ggplot(grouptag_counts, aes(x = createdAt, y = count, colour = grouptag)) +
  geom_line(aes(group = grouptag)) +
  xlab('Registration Date') + ylab('senseBox count')

## ----grouptag_summary----------------------------------------------------
grouptag_counts %>%
  summarise(
    oldest = min(createdAt),
    newest = max(createdAt),
    count = max(count)
  ) %>%
  arrange(desc(count))

## ----growthrate_registered, warning=FALSE, message=FALSE, results='hide'----
bins = 'week'
mvavg_bins = 6

growth = boxes %>%
  mutate(week = cut(as.Date(createdAt), breaks = bins)) %>%
  group_by(week) %>%
  summarize(count = length(week)) %>%
  mutate(event = 'registered')

## ----growthrate_inactive, warning=FALSE, message=FALSE, results='hide'----
inactive = boxes %>%
  # remove boxes that were updated in the last two days,
  # b/c any box becomes inactive at some point by definition of updatedAt
  filter(updatedAt < now() - days(2)) %>%
  mutate(week = cut(as.Date(updatedAt), breaks = bins)) %>%
  group_by(week) %>%
  summarize(count = length(week)) %>%
  mutate(event = 'inactive')

## ----growthrate, warning=FALSE, message=FALSE, results='hide'------------
boxes_by_date = bind_rows(growth, inactive) %>% group_by(event)

ggplot(boxes_by_date, aes(x = as.Date(week), colour = event)) +
  xlab('Time') + ylab(paste('rate per ', bins)) +
  scale_x_date(date_breaks="years", date_labels="%Y") +
  scale_colour_manual(values = c(registered = 'lightgreen', inactive = 'grey')) +
  geom_point(aes(y = count), size = 0.5) +
  # moving average, make first and last value NA (to ensure identical length of vectors)
  geom_line(aes(y = rollmean(count, mvavg_bins, fill = list(NA, NULL, NA))))

## ----exposure_duration, message=FALSE------------------------------------
duration = boxes %>%
  group_by(exposure) %>%
  filter(!is.na(updatedAt)) %>%
  mutate(duration = difftime(updatedAt, createdAt, units='days'))

ggplot(duration, aes(x = exposure, y = duration)) +
  geom_boxplot() +
  coord_flip() + ylab('Duration active in Days')

## ----grouptag_duration, message=FALSE------------------------------------
duration = boxes %>%
  group_by(grouptag) %>%
  # only include grouptags with 8 or more members
  filter(length(grouptag) >= 8 && !is.na(grouptag) && !is.na(updatedAt)) %>%
  mutate(duration = difftime(updatedAt, createdAt, units='days'))
  
ggplot(duration, aes(x = grouptag, y = duration)) +
  geom_boxplot() +
  coord_flip() + ylab('Duration active in Days')

duration %>%
  summarize(
    duration_avg = round(mean(duration)),
    duration_min = round(min(duration)),
    duration_max = round(max(duration)),
    oldest_box = round(max(difftime(now(), createdAt, units='days')))
  ) %>%
  arrange(desc(duration_avg))

## ----year_duration, message=FALSE----------------------------------------
# NOTE: boxes older than 2016 missing due to missing updatedAt in database
duration = boxes %>%
  mutate(year = cut(as.Date(createdAt), breaks = 'year')) %>%
  group_by(year) %>%
  filter(!is.na(updatedAt)) %>%
  mutate(duration = difftime(updatedAt, createdAt, units='days'))

ggplot(duration, aes(x = substr(as.character(year), 0, 4), y = duration)) +
  geom_boxplot() +
  coord_flip() + ylab('Duration active in Days') + xlab('Year of Registration')

