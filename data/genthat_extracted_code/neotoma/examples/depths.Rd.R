library(neotoma)


### Name: depths
### Title: Extracts the depth values from a 'download' object
### Aliases: depths depths.default depths.download depths.download_list
### Keywords: IO connection

### ** Examples

## Not run: 
##D # Provide a vector of depths to generate a new age model:
##D # The dataset id 684 is for Devils Lake, a record published by Louis Maher Jr.
##D 
##D pollen.data <- get_download(684)
##D pollen.chron <- get_chroncontrol(pollen.data)[[1]]
##D 
##D age_sds <- pollen.chron$chron.control$age - focal$chron.control$age.young,
##D get_curves <- ifelse(regexpr("Radiocarbon",
##D                              pollen.chron$chron.control$control.type) > -1, 
##D                      'intcal13', 'normal')
##D 
##D new_chron <- Bchron::Bchronology(ages   = pollen.chron$chron.control$age,
##D                                  ageSds = age_sds
##D                                  positions = pollen.chron$chron.control$depth,
##D                                  calCurves = , 
##D                                  predictPositions = depths(pollen.data))
##D 
## End(Not run)



