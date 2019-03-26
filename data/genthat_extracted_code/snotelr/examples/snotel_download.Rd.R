library(snotelr)


### Name: snotel_download
### Title: Dowloads snotel data based upon a subset of the sno-tel info as
###   provided by snotel_info()
### Aliases: snotel_download
### Keywords: SNOTEL, USDA, locations, scraping sites, web

### ** Examples


## Not run: 
##D # download data for SNOTEL site 429 and 1287, returning data to 
##D # the R workspace
##D df <- snotel_download(site_id = c(429,1287), internal = TRUE)
##D 
##D # list a few first rows
##D head(df)
## End(Not run)



