library(daymetr)


### Name: download_daymet_batch
### Title: This function downloads 'Daymet' data for several single pixel
###   location, as specified by a batch file.
### Aliases: download_daymet_batch
### Keywords: DAYMET, climate data

### ** Examples


## Not run: 
##D # The download_daymet_batch() routine is a wrapper around
##D # the download_daymet() function. It queries a file with
##D # coordinates to easily download a large batch of daymet
##D # pixel locations. When internal = TRUE, the data is stored
##D # in a structured list in an R variable. If FALSE, the data
##D # is written to disk.
##D 
##D # create demo locations (two sites)
##D locations = data.frame(site = c("site1", "site2"),
##D                       lat = rep(36.0133, 2),
##D                       lon = rep(-84.2625, 2))
##D 
##D # write data to csv file
##D write.table(locations, paste0(tempdir(),"/locations.csv"),
##D            sep = ",",
##D            col.names = TRUE,
##D            row.names = FALSE,
##D            quote = FALSE)
##D 
##D # download data, will return nested list of daymet data
##D df_batch = download_daymet_batch(file_location = paste0(tempdir(),
##D                                                         "/locations.csv"),
##D                                     start = 1980,
##D                                     end = 1980,
##D                                     internal = TRUE,
##D                                     silent = TRUE)
##D 
##D #' # For other practical examples consult the included
##D # vignette. 
## End(Not run)



