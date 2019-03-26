library(mousetrap)


### Name: mt_import_wide
### Title: Import mouse-tracking data saved in wide format.
### Aliases: mt_import_wide

### ** Examples

# Create data in wide format for test purposes
mt_data_wide <- mt_export_wide(mt_example,
  use2_variables=c("subject_nr", "Condition"))

# Import the data using mt_import_wide
mt_data <- mt_import_wide(mt_data_wide,
  xpos_label="xpos", ypos_label="ypos",
  timestamps_label="timestamps")




