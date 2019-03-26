library(mds)


### Name: exposure
### Title: MD-PMS Exposure Data Frame
### Aliases: exposure

### ** Examples

# A barebones dataset
ex <- exposure(sales, "sales_month", "device_name")
# With more variables and variable types
ex <- exposure(
  data_frame=sales,
  time="sales_month",
  device_hierarchy="device_name",
  match_levels="region",
  count="sales_volume")




