library(spocc)


### Name: fixnames
### Title: Change names to be the same for each taxon.
### Aliases: fixnames

### ** Examples

## Not run: 
##D spp <- c('Danaus plexippus','Accipiter striatus','Pinus contorta')
##D dat <- occ(spp, from='gbif', gbifopts=list(hasCoordinate=TRUE), limit=50)
##D fixnames(dat, how="shortest")$gbif
##D fixnames(dat, how="query")$gbif
##D fixnames(dat, how="supplied", namevec = c('abc', 'def', 'ghi'))$gbif
##D 
##D dat <- occ(spp, from='ecoengine', limit=50)
##D ## doesn't changes things
##D fixnames(dat, how="shortest")$ecoengine$data$Danaus_plexippus
##D ## this is better
##D fixnames(dat, how="query")$ecoengine$data$Danaus_plexippus
##D ## or this
##D fixnames(dat, how="supplied", 
##D  namevec = c("Danaus","Accipiter","Pinus"))$ecoengine$data$Danaus_plexippus
## End(Not run)



