library(mudata2)


### Name: mutate_data
### Title: Modify mudata tables
### Aliases: mutate_data mutate_params mutate_locations mutate_datasets
###   mutate_columns mutate_tbl mutate_tbl.default

### ** Examples

library(lubridate)
second_lake_temp %>% 
  mutate_data(datetime = with_tz(datetime, "America/Halifax"))




