library(VWPre)


### Name: prep_data
### Title: Check the classes of specific columns and re-assigns as
###   necessary.
### Aliases: prep_data

### ** Examples

## Not run: 
##D # Typical DataViewer output contains a column called "RECORDING_SESSION_LABEL"
##D # corresponding to the subject.
##D # To prepare the data...
##D library(VWPre)
##D df <- prep_data(data = dat, Subject = "RECORDING_SESSION_LABEL", Item = "ItemCol")
## End(Not run)



