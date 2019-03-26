library(meltt)


### Name: meltt_validate
### Title: Validation method to assess data integrated by meltt.
### Aliases: meltt_validate

### ** Examples

## No test: 
data(crashMD)
output <- meltt(crash_data1, crash_data2, crash_data3,
		taxonomies = crash_taxonomies, twindow = 1, spatwindow = 3)
## End(No test)
## Not run: 
##D # app will activate to validate sample.
##D meltt_validate(output)
##D 
##D # for smaller sample, must reset to overwrite existing validation sample
##D meltt_validate(output, sample_prop=.1, reset = TRUE) 
##D 
##D # override of the validation to get a sense of the report
##D output$validation$validation_set$are_match = 1 
##D 
##D meltt_validate(output)
## End(Not run)



