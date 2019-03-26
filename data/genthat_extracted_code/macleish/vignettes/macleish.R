## ---- include=FALSE------------------------------------------------------
library(knitr)
opts_chunk$set(fig.width = 6, fig.height = 4)

## ---- message=FALSE------------------------------------------------------
library(macleish)

## ------------------------------------------------------------------------
head(whately_2015)
tail(whately_2015)

## ---- eval=FALSE---------------------------------------------------------
#  head(orchard_2015)
#  tail(orchard_2015)

## ---- eval=FALSE---------------------------------------------------------
#  help("etl_extract.etl_macleish")

## ----daily, message=FALSE, warning=FALSE---------------------------------
library(ggplot2)
library(dplyr)
library(lubridate)
daily <- whately_2015 %>%
  mutate(the_date = as.Date(when, tz = "EST")) %>%
  group_by(the_date) %>%
  summarize(N = n(), avg_temp = mean(temperature), 
            max_temp = max(temperature), min_temp =
              min(temperature))

## ----temp-plot, message=FALSE--------------------------------------------
temp_plot <- ggplot(data = whately_2015, aes(x = when, y = temperature)) +
  geom_line(color = "lightgray") + 
  geom_line(data = daily, aes(x = as.POSIXct(the_date), 
                              y = avg_temp)) + 
  xlab(NULL) + ylab("Temperature (Celsius)")
if (require(mgcv)) {
  temp_plot + geom_smooth()
} else {
  temp_plot
}

## ----temp-table----------------------------------------------------------
monthly_w <- whately_2015 %>%
  mutate(the_month = month(when, label = TRUE, abbr = FALSE)) %>%
  group_by(the_month) %>%
  summarize(avg_temp = mean(temperature))
monthly_o <- orchard_2015 %>%
  mutate(the_month = month(when, label = TRUE, abbr = FALSE)) %>%
  group_by(the_month) %>%
  summarize(avg_temp = mean(temperature))
monthly_w %>%
  inner_join(monthly_o, by = "the_month")

## ----temp-extremes-------------------------------------------------------
whately_2015 %>%
  arrange(desc(temperature)) %>%
  head(1)
whately_2015 %>%
  arrange(temperature) %>%
  head(1)

## ------------------------------------------------------------------------
daily <- daily %>%
  mutate(temp_range = max_temp - min_temp)
daily %>%
  select(temp_range) %>%
  summary()

## ------------------------------------------------------------------------
daily %>%
  arrange(desc(temp_range)) %>%
  head(1)
daily %>%
  arrange(temp_range) %>%
  head()

## ----orchard-anolomies---------------------------------------------------
orchard_2015 %>%
  filter(month(when) == 11) %>%
  ggplot(aes(x = when, y = temperature)) +
    geom_line()

## ----humidity-table------------------------------------------------------
monthly_w <- whately_2015 %>%
  mutate(the_month = month(when, label = TRUE, abbr = FALSE)) %>%
  group_by(the_month) %>%
  summarize(avg_humidity_w = mean(rel_humidity))
monthly_o <- orchard_2015 %>%
  mutate(the_month = month(when, label = TRUE, abbr = FALSE)) %>%
  group_by(the_month) %>%
  summarize(avg_humidity_o = mean(rel_humidity))
monthly_w %>%
  inner_join(monthly_o, by = "the_month")

## ---- message=FALSE, warning=FALSE---------------------------------------
require(clifro)
orchard_2015 %>%
  with(windrose(wind_speed, wind_dir))

## ---- message=FALSE------------------------------------------------------
whately_2015 %>%
  with(windrose(wind_speed, wind_dir))

## ------------------------------------------------------------------------
sum(whately_2015$rainfall)

## ----rain-table----------------------------------------------------------
monthly_w <- whately_2015 %>%
  mutate(the_month = month(when, label = TRUE, abbr = FALSE)) %>%
  group_by(the_month) %>%
  summarize(total_precip_w = sum(rainfall))
monthly_o <- orchard_2015 %>%
  mutate(the_month = month(when, label = TRUE, abbr = FALSE)) %>%
  group_by(the_month) %>%
  summarize(total_precip_o = sum(rainfall))
monthly_w %>%
  inner_join(monthly_o, by = "the_month")

## ---- message=FALSE------------------------------------------------------
daily_precip <- whately_2015 %>%
  mutate(the_date = as.Date(when, tz = "EST")) %>%
  group_by(the_date) %>%
  summarize(N = n(), total_precip = sum(rainfall)) %>%
  mutate(cum_precip = cumsum(total_precip),
         cum_rescale = (cum_precip / max(cum_precip)) * max(total_precip))

## ----daily-precip, message=FALSE-----------------------------------------
ggplot(data = daily_precip, 
       aes(x = the_date, y = total_precip)) +
  geom_bar(stat = "identity") + 
  geom_line(aes(y = cum_rescale), color = "blue") + 
  ylab("Daily Precipitation (mm)") + xlab(NULL)

## ------------------------------------------------------------------------
names(macleish_layers)

## ---- eval=FALSE, message=FALSE------------------------------------------
#  library(leaflet)
#  leaflet() %>%
#    addTiles() %>%
#    addPolygons(data = macleish_layers[["boundary"]],
#                weight = 1) %>%
#    addPolygons(data = macleish_layers[["buildings"]],
#                weight = 1) %>%
#    addMarkers(data = subset(macleish_layers[["landmarks"]], grepl("Met", Label)),
#               popup = ~Label)

