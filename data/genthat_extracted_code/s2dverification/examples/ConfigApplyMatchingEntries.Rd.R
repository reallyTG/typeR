library(s2dverification)


### Name: ConfigApplyMatchingEntries
### Title: Apply Matching Entries To Dataset Name And Variable Name To Find
###   Related Info
### Aliases: ConfigApplyMatchingEntries
### Keywords: datagen

### ** Examples

# Create an empty configuration file
config_file <- paste0(tempdir(), "/example.conf")
ConfigFileCreate(config_file, confirm = FALSE)
# Open it into a configuration object
configuration <- ConfigFileOpen(config_file)
# Add an entry at the bottom of 4th level of file-per-startdate experiments 
# table which will associate the experiment "ExampleExperiment2" and variable 
# "ExampleVariable" to some information about its location.
configuration <- ConfigAddEntry(configuration, "experiments", 
                 "last", "ExampleExperiment2", "ExampleVariable", 
                 "/path/to/ExampleExperiment2/", 
                 "ExampleVariable/ExampleVariable_$START_DATE$.nc")
# Edit entry to generalize for any variable. Changing variable needs .
configuration <- ConfigEditEntry(configuration, "experiments", 1, 
                 var_name = ".*", 
                 file_path = "$VAR_NAME$/$VAR_NAME$_$START_DATE$.nc")
# Now apply matching entries for variable and experiment name and show the 
# result
match_info <- ConfigApplyMatchingEntries(configuration, 'tas', 
              exp = c('ExampleExperiment2'), show_result = TRUE)



