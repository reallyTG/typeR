library(deltar)


### Name: dr_df
### Title: Compute Delta R values for a set of dates
### Aliases: dr_df

### ** Examples

#' # Acquire "BSea" data set
data(BSea)
# Compute Delta R values and store them in the new object
# Note, that samples with known collection date need "shell" method
bsea_res <- dr_df(BSea, method = "shell")
# See basic statistics of the computed Delta R values
bsea_res$statistics
## Not run: 
##D # Acquire "adak" data set
##D data(adak)
##D # Compute Delta R values and store them in the new object
##D adak_res <- dr_df(adak)
##D # See basic statistics of the computed Delta R values
##D adak_res$statistics
##D # Save the results in the file "Adak.txt"
##D write.table(adak_res$statistics, "Adak.txt")
##D # Note, that it will be saved in the working directory
##D # See the path to the working directory
##D getwd()
##D # Acquire "coral" data set
##D data(coral)
##D # Compute Delta R values and store them in the new object
##D # Note, that 230Th dates do not need calibration
##D coral_res <- dr_df(coral, calCurves = "normal")
##D # See basic statistics of the computed Delta R values
##D coral_res$statistics
## End(Not run)



