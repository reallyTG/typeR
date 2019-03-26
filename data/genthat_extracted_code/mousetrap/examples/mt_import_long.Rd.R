library(mousetrap)


### Name: mt_import_long
### Title: Import mouse-tracking data saved in long format.
### Aliases: mt_import_long

### ** Examples

# Create data in long format for test purposes
mt_data_long <- mt_export_long(mt_example,
  use2_variables=c("subject_nr","Condition"))

# Import the data using mt_import_long
mt_data <- mt_import_long(mt_data_long)


## Not run: 
##D # Import a hypothetical dataset that contains the
##D # custom mouse-tracking variables angle and velocity
##D mt_data <- mt_import_long(exp_data,
##D   add_labels= c("angle", "velocity"))
## End(Not run)




