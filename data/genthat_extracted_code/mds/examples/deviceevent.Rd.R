library(mds)


### Name: deviceevent
### Title: MD-PMS Device Event Data Frame
### Aliases: deviceevent

### ** Examples

# A barebones dataset
de <- deviceevent(maude, "date_received", "device_name", "event_type")
# With more variables and variable types
de <- deviceevent(
  data_frame=maude,
  time="date_received",
  device_hierarchy=c("device_name", "device_class"),
  event_hierarchy=c("event_type", "medical_specialty_description"),
  key="report_number",
  covariates=c("region"),
  descriptors="_all_")




