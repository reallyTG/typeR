## ------------------------------------------------------------------------
library(mudata2)
data("ns_climate")
ns_climate

## ---- eval = FALSE-------------------------------------------------------
#  # write to directory
#  write_mudata(ns_climate, "ns_climate.mudata")
#  # write to ZIP
#  write_mudata(ns_climate, "ns_climate.mudata.zip")
#  # write to JSON
#  write_mudata(ns_climate, "ns_climate.mudata.json")

## ---- eval = FALSE-------------------------------------------------------
#  # read from directory
#  read_mudata("ns_climate.mudata")
#  # read from ZIP
#  read_mudata("ns_climate.mudata.zip")
#  # read from JSON
#  read_mudata("ns_climate.mudata.json")

## ------------------------------------------------------------------------
print(ns_climate)

## ------------------------------------------------------------------------
summary(ns_climate)

## ----autoplot, warning = FALSE, fig.width=7, fig.height=5----------------
autoplot(ns_climate)

## ------------------------------------------------------------------------
# extract the parameters table
ns_climate %>% tbl_params()

# exract the locations table
ns_climate %>% tbl_locations()

## ------------------------------------------------------------------------
# find out which parameters are available
ns_climate %>% distinct_params()

# subset by parameter
ns_climate %>% select_params(mean_temp, total_precip)

## ------------------------------------------------------------------------
ns_climate %>% select_params(contains("temp"))

## ------------------------------------------------------------------------
ns_climate %>% select_locations(Kentville = starts_with("KENT"))

## ------------------------------------------------------------------------
# only use locations whose last data point was after 2000
ns_climate %>%
  filter_locations(last_year > 2000)

# use only params measured in mm
ns_climate %>%
  filter_params(unit == "mm")

## ------------------------------------------------------------------------
library(lubridate)
# extract only June temperature from the data table
ns_climate %>%
  filter_data(month(date) == 6)

## ------------------------------------------------------------------------
ns_climate %>% tbl_data()

## ------------------------------------------------------------------------
ns_climate %>% tbl_data_wide()

## ------------------------------------------------------------------------
ns_climate %>% 
  select_params(mean_temp) %>%
  filter_data(year(date) == 1960) %>%
  tbl_data_wide(key = location)

## ------------------------------------------------------------------------
temp_1960 <- ns_climate %>%
  # pick parameters
  select_params(contains("temp")) %>%
  # pick locations
  select_locations(`Sable Island` = starts_with("SABLE"),
                   `Kentville` = starts_with("KENT"),
                   `Badeck` = starts_with("BADD")) %>%
  # filter data table
  filter_data(year(date) == 1960) %>%
  # extract data in wide format
  tbl_data_wide()

temp_1960

## ---- warning = FALSE, fig.width = 7, fig.height = 5---------------------
library(ggplot2)
ggplot(temp_1960, 
       aes(x = date, y = mean_temp, 
           ymin = extr_min_temp, 
           ymax = extr_max_temp,
           col = location, fill = location)) +
  geom_ribbon(alpha = 0.2, col = NA) +
  geom_line()

