library(rgbif)


### Name: occ_download_import
### Title: Import a downloaded file from GBIF.
### Aliases: occ_download_import as.download as.download.character
###   as.download.download

### ** Examples

## Not run: 
##D # First, kick off at least 1 download, then wait for the job to be complete
##D # Then use your download keys
##D res <- occ_download_get(key="0000066-140928181241064", overwrite=TRUE)
##D occ_download_import(res)
##D 
##D occ_download_get(key="0000066-140928181241064", overwrite = TRUE) %>%
##D   occ_download_import
##D 
##D # coerce a file path to the right class to feed to occ_download_import
##D # as.download("0000066-140928181241064.zip")
##D # as.download(key = "0000066-140928181241064")
##D # occ_download_import(as.download("0000066-140928181241064.zip"))
##D 
##D # download a dump that has a CSV file
##D # res <- occ_download_get(key = "0001369-160509122628363", overwrite=TRUE)
##D # occ_download_import(res)
##D # occ_download_import(key = "0001369-160509122628363")
## End(Not run)



