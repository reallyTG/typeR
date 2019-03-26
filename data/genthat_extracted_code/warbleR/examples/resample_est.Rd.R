library(warbleR)


### Name: resample_est
### Title: Resample wave objects in a extended selection table
### Aliases: resample_est

### ** Examples

## Not run: 
##D # Set temporary working directory
##D # setwd(tempdir())
##D 
##D data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec_table"))
##D writeWave(Phae.long1,"Phae.long1.wav")
##D writeWave(Phae.long2,"Phae.long2.wav")
##D writeWave(Phae.long3,"Phae.long3.wav")
##D writeWave(Phae.long4,"Phae.long4.wav") 
##D 
##D # create extended selection table
##D X <- selection_table(X = selec.table, extended = TRUE, confirm.extended = FALSE, pb = FALSE)
##D 
##D # resample
##D Y <- resample_est(X)
## End(Not run)




