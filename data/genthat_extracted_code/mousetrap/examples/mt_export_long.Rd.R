library(mousetrap)


### Name: mt_export_long
### Title: Export mouse-tracking data.
### Aliases: mt_export_long mt_export_wide

### ** Examples

# Export data in long format
# (and include information about condition and subject_nr)
mt_data_long <- mt_export_long(mt_example,
  use2_variables=c("subject_nr","Condition"))

# Export data in wide format
# (and include information about condition and subject_nr)
mt_data_wide <- mt_export_wide(mt_example,
  use2_variables=c("subject_nr","Condition"))




