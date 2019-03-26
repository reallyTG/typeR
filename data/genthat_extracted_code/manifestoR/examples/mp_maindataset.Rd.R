library(manifestoR)


### Name: mp_maindataset
### Title: Access the Manifesto Project's Main Dataset
### Aliases: mp_maindataset mp_southamerica_dataset

### ** Examples

## Not run: 
##D mpds <- mp_maindataset()
##D head(mpds)
##D median(subset(mpds, countryname == "Switzerland")$rile, na.rm = TRUE)
## End(Not run)
## Not run: 
##D mp_maindataset(download_format = "dta") %>% read_dta() ## requires package haven
## End(Not run)



