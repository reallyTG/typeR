## ----initial, echo = FALSE, cache = FALSE, results = 'hide'--------------
library(knitr)
opts_chunk$set(
  warning = FALSE, message = FALSE, echo = TRUE,
  fig.width = 7, fig.height = 6, fig.align = 'centre',
  comment = "#>"
)
options(tibble.print_min = 5)

## ----load----------------------------------------------------------------
library(tidyr)
library(dplyr)
library(viridis)
library(sugrrants)
pedestrian17 <- filter(pedestrian, Year == "2017")
pedestrian17

## ----centre--------------------------------------------------------------
centre <- pedestrian17 %>% 
  filter(Sensor_Name == "Melbourne Convention Exhibition Centre")
centre_calendar <- centre %>%
  frame_calendar(x = Time, y = Hourly_Counts, date = Date, calendar = "monthly")
centre_calendar

## ----centre-plot, fig.height = 7-----------------------------------------
p1 <- centre_calendar %>% 
  ggplot(aes(x = .Time, y = .Hourly_Counts, group = Date)) +
  geom_line()
p1

## ----centre-more, fig.height = 7-----------------------------------------
prettify(p1)

## ----centre-free, fig.height = 6, fig.width = 9--------------------------
centre_calendar_free <- centre %>%
  frame_calendar(x = Time, y = Hourly_Counts, date = Date, calendar = "monthly",
    scale = "free", ncol = 4)
p2 <- ggplot(centre_calendar_free, 
        aes(x = .Time, y = .Hourly_Counts, group = Date)) +
  geom_line()
prettify(p2)

## ----centre-wday, fig.height = 6, fig.width = 9--------------------------
centre_calendar_wday <- centre %>%
  frame_calendar(x = Time, y = Hourly_Counts, date = Date, calendar = "monthly",
    scale = "free_wday", ncol = 4)
p3 <- ggplot(centre_calendar_wday, 
        aes(x = .Time, y = .Hourly_Counts, group = Date)) +
  geom_line()
prettify(p3)

## ----overlay, fig.height = 6, fig.width = 9------------------------------
two_sensors <- c("Lonsdale St (South)", "Melbourne Convention Exhibition Centre")
two_sensors_df <- pedestrian17 %>%
  filter(Sensor_Name %in% two_sensors)
two_sensors_calendar <- two_sensors_df %>%
  frame_calendar(x = Time, y = Hourly_Counts, date = Date, ncol = 4)
p4 <- ggplot(two_sensors_calendar) +
  geom_line(
    data = filter(two_sensors_calendar, Sensor_Name == two_sensors[1]),
    aes(.Time, .Hourly_Counts, group = Date), colour = "#1b9e77"
  ) +
  geom_line(
    data = filter(two_sensors_calendar, Sensor_Name == two_sensors[2]),
    aes(.Time, .Hourly_Counts, group = Date), colour = "#d95f02"
  )
prettify(p4)

## ----ped-facet, fig.height = 11, fig.width = 9---------------------------
grped_calendar <- two_sensors_df %>% 
  group_by(Sensor_Name) %>%
  frame_calendar(x = Time, y = Hourly_Counts, date = Date, ncol = 4)
p5 <- grped_calendar %>%
  ggplot(aes(x = .Time, y = .Hourly_Counts, group = Date)) +
  geom_line(aes(colour = Sensor_Name)) +
  facet_grid(Sensor_Name ~ .) +
  scale_color_brewer(palette = "Dark2") +
  theme(legend.position = "bottom")
prettify(p5)

## ----ped-lag, fig.height = 2, fig.width = 8, warning = TRUE--------------
centre_lagged <- centre %>%
  mutate(Lagged_Counts = dplyr::lag(Hourly_Counts))
centre_lagged_calendar <- centre_lagged %>% 
  frame_calendar(x = Hourly_Counts, y = Lagged_Counts, date = Date,
    calendar = "daily")
p6 <- centre_lagged_calendar %>%
  ggplot(aes(x = .Hourly_Counts, y = .Lagged_Counts, group = Date)) +
  geom_point(size = 0.5)
prettify(p6, size = 3)

## ----ped-daily-----------------------------------------------------------
two_sensors_wide <- two_sensors_df %>% 
  select(-Sensor_ID) %>% 
  spread(key = Sensor_Name, value = Hourly_Counts) %>% 
  rename(
    Lonsdale = `Lonsdale St (South)`,
    Centre = `Melbourne Convention Exhibition Centre`
  ) %>%
  mutate(
    Diff = Centre - Lonsdale,
    More = if_else(Diff > 0, "Centre", "Lonsdale")
  )
sensors_wide_calendar <- two_sensors_wide %>% 
  frame_calendar(x = Time, y = vars(Centre, Lonsdale), date = Date, 
    calendar = "weekly")
sensors_wide_calendar

## ----ped-daily-plot------------------------------------------------------
p7 <- sensors_wide_calendar %>%
  ggplot() +
  geom_rect(aes(
    xmin = .Time, xmax = .Time + 0.005,
    ymin = .Lonsdale, ymax = .Centre, fill = More
  )) +
  scale_fill_brewer(palette = "Dark2") +
  theme(legend.position = "bottom")
prettify(p7)

## ----ped-max-------------------------------------------------------------
centre_daily <- centre %>%
  group_by(Date) %>%
  summarise(Max_Counts = max(Hourly_Counts)) %>%
  ungroup()
centre_max_calendar <- centre_daily %>%
  frame_calendar(x = 1, y = 1, date = Date, calendar = "monthly")
head(centre_max_calendar)
p8 <- centre_max_calendar %>%
  ggplot(aes(x = .x, y = .y)) +
  geom_tile(aes(fill = Max_Counts), colour = "grey50") +
  scale_fill_viridis()
prettify(p8, label = "label", label.padding = unit(0.2, "lines"))

