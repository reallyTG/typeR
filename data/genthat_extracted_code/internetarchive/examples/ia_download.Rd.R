library(internetarchive)


### Name: ia_download
### Title: Download files for Internet Archive items.
### Aliases: ia_download

### ** Examples

## Not run: 
##D if (require(dplyr)) {
##D   dir <- tempdir()
##D   ia_get_items("thedamnationofth00133gut") %>%
##D     ia_files() %>%
##D     filter(type == "txt") %>% # download only the files we want
##D     ia_download(dir = dir, extended_name = FALSE)
##D }
## End(Not run)



