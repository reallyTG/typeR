library(BiodiversityR)


### Name: makecommunitydataset
### Title: Make a Community Dataset from a Stacked Dataset
### Aliases: makecommunitydataset stackcommunitydataset
### Keywords: multivariate

### ** Examples


## Not run: 
##D dune.file <- normalizePath(paste(system.file(package="BiodiversityR"), 
##D     '/etc/dunestacked.csv', sep=''))
##D dune.stacked <- read.csv(dune.file)
##D 
##D # dune.stacked has different variables for sites, species and abundance
##D head(dune.stacked)
##D dune.comm2 <- makecommunitydataset(dune.stacked, row='sites', column='species', 
##D     value='abundance')
##D 
##D # recreate the original stack
##D dune.stacked2 <- stackcommunitydataset(dune.comm2, remove.zeroes=T)
##D 
## End(Not run)




