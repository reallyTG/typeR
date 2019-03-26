library(mds)


### Name: time_series
### Title: Generate Time Series from Defined Analysis or Analyses
### Aliases: time_series time_series.list time_series.mds_das
###   time_series.mds_da

### ** Examples

de <- deviceevent(maude, "date_received", "device_name", "event_type")
ex <- exposure(sales, "sales_month", "device_name", count="sales_volume")
da <- define_analyses(de, "device_name", exposure=ex)
# Time series on one analysis
time_series(da, de, ex)
# Time series on multiple analyses
time_series(da[1:3], de, ex)




