library(vegawidget)


### Name: vw_serialize_data
### Title: Serialize data-frame time-columns
### Aliases: vw_serialize_data

### ** Examples

  # datetimes
  data_seattle_hourly %>% head()
  data_seattle_hourly %>% head() %>% vw_serialize_data(iso_dttm = TRUE)
  data_seattle_hourly %>% head() %>% vw_serialize_data(iso_dttm = FALSE)

  # dates
  data_seattle_daily %>% head()
  data_seattle_daily %>% head() %>% vw_serialize_data(iso_date = TRUE)
  data_seattle_daily %>% head() %>% vw_serialize_data(iso_date = FALSE)




