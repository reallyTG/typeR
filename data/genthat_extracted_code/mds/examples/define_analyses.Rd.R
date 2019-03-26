library(mds)


### Name: define_analyses
### Title: Assess & Save MD-PMS Analyses Definitions
### Aliases: define_analyses

### ** Examples

# Device-Events
de <- deviceevent(
  data_frame=maude,
  time="date_received",
  device_hierarchy=c("device_name", "device_class"),
  event_hierarchy=c("event_type", "medical_specialty_description"),
  key="report_number",
  covariates=c("region"),
  descriptors="_all_")
# Exposures
ex <- exposure(
  data_frame=sales,
  time="sales_month",
  device_hierarchy="device_name",
  match_levels="region",
  count="sales_volume")
# Defined Analyses - Simple example
da <- define_analyses(de, "device_name")
# Defined Analyses - Simple example with a quarterly analysis
da <- define_analyses(de, "device_name", date_level_n=3)
# Defined Analyses - Example with event type, exposures, and covariates
da <- define_analyses(de, "device_name", "event_type", ex, covariates="region")




