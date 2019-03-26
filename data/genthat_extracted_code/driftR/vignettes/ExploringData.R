## ---- eval=FALSE---------------------------------------------------------
#  df <- read_csv("waterData.csv")

## ---- eval=FALSE---------------------------------------------------------
#  df1 <- read_csv("waterData_Jan17.csv")
#  df2 <- read_csv("waterData_Feb17.csv")
#  
#  df <- bind_rows(df1, df2)

## ---- eval=FALSE---------------------------------------------------------
#  > summary(df$SpCond)
#     Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#   0.7450  0.7520  0.7670  0.7719  0.7900  0.8180
#  > summary(df$SpCond_Corr)
#     Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#   0.7495  0.7677  0.8018  0.8067  0.8422  0.8872

## ---- eval=FALSE---------------------------------------------------------
#  library(ggplot2)  # data visualization
#  library(scales)   # date/time scales for plots
#  
#  library(dplyr)    # data wrangling
#  library(tidyr)    # reshaping data
#  library(stringr)  # tools for strings

## ---- eval=FALSE---------------------------------------------------------
#  ggplot(data = df) +
#    geom_histogram(mapping = aes(x = pH), bins = 10)

## ---- eval=FALSE---------------------------------------------------------
#  df %>%
#    mutate(dateTime = str_c(Date, Time, sep = " ", collapse = NULL)) %>%
#    mutate(dateTime = as.POSIXct(dateTime, format = "%m/%d/%Y %H:%M:%S")) %>%
#    ggplot() +
#      geom_line(mapping = aes(x = dateTime, y = SpCond))

## ---- eval=FALSE---------------------------------------------------------
#  > df %>%
#  +     mutate(dateTime = str_c(Date, Time, sep = " ", collapse = NULL)) %>%
#  +     mutate(dateTime = as.POSIXct(dateTime, format = "%m/%d/%Y %H:%M:%S")) %>%
#  +     select(dateTime, SpCond, SpCond_Corr) %>%
#  +     gather(key = "measure", value = "value", SpCond, SpCond_Corr) %>%
#  +     arrange(dateTime)
#  # A tibble: 3,024 x 3
#                dateTime     measure     value
#                  <dttm>       <chr>     <dbl>
#   1 2015-09-18 13:00:52      SpCond 0.7490000
#   2 2015-09-18 13:00:52 SpCond_Corr 0.7494559
#   3 2015-09-18 13:05:52      SpCond 0.7490000
#   4 2015-09-18 13:05:52 SpCond_Corr 0.7495014
#   5 2015-09-18 13:10:52      SpCond 0.7500000
#   6 2015-09-18 13:10:52 SpCond_Corr 0.7505470
#   7 2015-09-18 13:15:52      SpCond 0.7500000
#   8 2015-09-18 13:15:52 SpCond_Corr 0.7505925
#   9 2015-09-18 13:20:51      SpCond 0.7500000
#  10 2015-09-18 13:20:51 SpCond_Corr 0.7506379
#  # ... with 3,014 more rows

## ---- eval=FALSE---------------------------------------------------------
#  df %>%
#    mutate(dateTime = str_c(Date, Time, sep = " ", collapse = NULL)) %>%
#    mutate(dateTime = as.POSIXct(dateTime, format = "%m/%d/%Y %H:%M:%S")) %>%
#    select(dateTime, SpCond, SpCond_Corr) %>%
#    gather(key = "measure", value = "value", SpCond, SpCond_Corr) %>%
#    ggplot() +
#      geom_line(mapping = aes(x = dateTime, y = value, group = measure, color = measure))

## ---- eval=FALSE---------------------------------------------------------
#  df %>%
#    mutate(dateTime = str_c(Date, Time, sep = " ", collapse = NULL)) %>%
#    mutate(dateTime = as.POSIXct(dateTime, format = "%m/%d/%Y %H:%M:%S")) %>%
#    select(dateTime, SpCond, SpCond_Corr) %>%
#    gather(key = "measure", value = "value", SpCond, SpCond_Corr) %>%
#    ggplot() +
#      geom_smooth(mapping = aes(x = dateTime, y = value, group = measure, color = measure))

## ---- eval=FALSE---------------------------------------------------------
#  ggplot(data = df) +
#    geom_point(mapping = aes(x = SpCond_Corr, y = Chloride_Corr))

## ---- eval=FALSE---------------------------------------------------------
#  ggplot(data = df) +
#    geom_point(mapping = aes(x = SpCond_Corr, y = Chloride_Corr, color = Date))

## ---- eval=FALSE---------------------------------------------------------
#  ggplot(data = df) +
#    geom_point(mapping = aes(x = SpCond_Corr, y = Chloride_Corr, color = Date)) +
#    facet_wrap(~ Date) +
#    theme(legend.position="none")

## ---- eval=FALSE---------------------------------------------------------
#  ggplot(data = df) +
#    geom_point(mapping = aes(x = SpCond_Corr, y = Chloride_Corr), color = "#cccccc") +
#    geom_smooth(mapping = aes(x = SpCond_Corr, y = Chloride_Corr, color = Date)) +
#    facet_wrap(~ Date) +
#    theme(legend.position="none")

## ---- eval=FALSE---------------------------------------------------------
#  ggplot(data = df, mapping = aes(x = SpCond_Corr, y = Chloride_Corr, color = Date)) +
#    geom_point(color = "#cccccc") +
#    geom_smooth() +
#    facet_wrap(~ Date)

## ---- eval=FALSE---------------------------------------------------------
#  df %>%
#    mutate(secondHalf = ifelse(Date == "9/21/2015" | Date == "9/22/2015" | Date == "9/23/2015", TRUE, FALSE)) %>%
#    ggplot() +
#      geom_boxplot(mapping = aes(x = secondHalf, y = pH_Corr))

## ---- eval=FALSE---------------------------------------------------------
#  df %>%
#    mutate(dateTime = str_c(Date, Time, sep = " ", collapse = NULL)) %>%
#    mutate(dateTime = as.POSIXct(dateTime, format = "%m/%d/%Y %H:%M:%S")) %>%
#    select(dateTime, SpCond, SpCond_Corr) %>%
#    gather(key = "measure", value = "value", SpCond, SpCond_Corr) %>%
#    ggplot() +
#      geom_smooth(mapping = aes(x = dateTime, y = value, group = measure, color = measure)) +
#      scale_x_datetime(labels = date_format("%m-%d-%Y"), date_breaks = "1 day") +
#      labs(
#        title = "Comparison of Corrected and Uncorrected Specific Conductance Values",
#        subtitle = "Example Creek, Eastern Missouri",
#        x = "Date",
#        y = "Specific Conductance",
#        caption = "Smoothed using a generalized additive model; \nPlot produced by the Saint Louis University Hydrology and Geochemistry Research Lab",
#        color = "Series"
#      ) +
#      scale_colour_discrete(labels=c("Raw Conductivity", "Corrected Conductivity"))

## ---- eval=FALSE---------------------------------------------------------
#  ggsave("plotName.png", width = 800, height = 600, units = "mm", dpi = 300)

