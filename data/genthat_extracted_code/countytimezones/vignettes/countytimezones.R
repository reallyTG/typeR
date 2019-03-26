## ----echo = FALSE--------------------------------------------------------
library(countytimezones)

## ----eval = FALSE--------------------------------------------------------
#  install.packages("countytimezones")

## ----eval = FALSE--------------------------------------------------------
#  library(devtools)
#  install_github("geanders/countytimezones")
#  library(countytimezones)

## ------------------------------------------------------------------------
calc_local_time(date_time = "1999-01-01 08:00", fips = "36061")

## ------------------------------------------------------------------------
ex_fips <- c("36061", "17031", "06037")
calc_local_time(date_time = "1999-01-01 08:00", fips = ex_fips)

## ------------------------------------------------------------------------
ex_datetime <- c("1999-01-01 08:00", "1999-01-01 09:00",
                 "1999-01-01 10:00")
ex_fips <- c("36061", "17031", "06037")
calc_local_time(date_time = ex_datetime, fips = ex_fips)

## ------------------------------------------------------------------------
ex_df <- data.frame(datetime = c("1999-01-01 08:00", "1999-01-01 09:00",
                                 "1999-01-01 10:00"),
                    fips = c("36061", "17031", "06037"))
add_local_time(df = ex_df, fips = ex_df$fips,
              datetime_colname = "datetime")

## ----message = FALSE-----------------------------------------------------
data(county_tzs)
example_df <- data.frame(fips = county_tzs$fips,
                 datetime = "1999-01-01 08:30")
head(example_df)

example_df <- add_local_time(df = example_df,
                             fips = example_df$fips,
                             datetime_colname = "datetime")
head(example_df)

## ----fig.width = 7, fig.height = 5, message = FALSE----------------------
library(choroplethr)
library(choroplethrMaps)
library(ggplot2)
library(dplyr)

to_plot <- example_df %>%
  select(fips, local_time) %>%
  mutate(local_time = factor(local_time)) %>%
  dplyr::rename(region = fips, value = local_time)
a <- CountyChoropleth$new(to_plot)
a$ggplot_scale <- scale_fill_brewer(type = "qual", drop = FALSE)
a$render()

## ----fig.width = 7, fig.height = 5---------------------------------------
example_df2 <- data.frame(fips = county_tzs$fips,
                 datetime = "1999-07-01 08:30") 
example_df2 <- add_local_time(example_df2, fips = example_df2$fips,
                              datetime_colname = "datetime")

to_plot <- example_df2 %>%
  select(fips, local_time) %>%
  mutate(local_time = factor(local_time)) %>%
  dplyr::rename(region = fips, value = local_time)
a <- CountyChoropleth$new(to_plot)
a$ggplot_scale <- scale_fill_brewer(type = "qual", drop = FALSE)
a$render()

## ------------------------------------------------------------------------
data(floyd)
head(floyd)

## ----fig.width = 7, fig.height = 5, warning = FALSE, message = FALSE-----
eastern_states <- c("alabama", "arkansas", "connecticut", "delaware",
                            "district of columbia", "florida", "georgia", "illinois",
                            "indiana", "iowa", "kansas", "kentucky", "louisiana",
                            "maine", "maryland", "massachusetts", "michigan",
                            "mississippi", "missouri", "new hampshire", "new jersey",
                            "new york", "north carolina", "ohio", "oklahoma",
                            "pennsylvania", "rhode island", "south carolina",
                            "tennessee", "texas", "vermont", "virginia",
                            "west virginia", "wisconsin")

library(lubridate)
to_plot <- select(floyd, fips, closest_time_utc) %>%
  mutate(fips = as.numeric(fips),
         closest_time_utc = ymd_hm(closest_time_utc)) %>%
  mutate(closest_time_utc = format(closest_time_utc, "%Y-%m-%d")) %>%
  dplyr::rename(region = fips, value = closest_time_utc)
a <- CountyChoropleth$new(to_plot)
a$ggplot_scale <- scale_fill_brewer(type = "qual", drop = FALSE)
a$set_zoom(eastern_states)
a$render()

## ------------------------------------------------------------------------
floyd <- add_local_time(floyd, fips = floyd$fips,
                        datetime_colname = "closest_time_utc")
head(floyd)

## ----fig.width = 7, fig.height = 5, warning = FALSE, message = FALSE-----
to_plot <- select(floyd, fips, local_date) %>%
  mutate(fips = as.numeric(fips))%>%
  dplyr::rename(region = fips, value = local_date)
a <- CountyChoropleth$new(to_plot)
a$ggplot_scale <- scale_fill_brewer(type = "qual", drop = FALSE)
a$set_zoom(eastern_states)
a$render()

