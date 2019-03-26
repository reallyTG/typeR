library(metsyn)


### Name: make_metsyn
### Title: Creation of the 'metsyn' dataset made of Meteo France Synop data
### Aliases: make_metsyn metsyn

### ** Examples

## Not run: 
##D dir.create("data-raw", showWarnings = FALSE)
##D for (y in 1996:2016) {
##D   for (m in 1:12) {
##D     m <- if (m < 10) paste0(0, m) else m
##D     download_monthly_synop(date = paste0(y, m), 
##D                            mode = "wb")
##D   }
##D }
##D make_metsyn(save_it = TRUE)
## End(Not run)




