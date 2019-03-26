library(pbatR)


### Name: pbat.work
### Title: pbatRwork Temp Directory
### Aliases: pbat.work pbat.unwork
### Keywords: interface

### ** Examples

## Not run: 
##D ped <- read.ped("mydata")
##D phe <- read.phe("myphe")
##D 
##D cur <- pbat.work( ped )
##D 
##D res <- pbat.m(trait ~ NONE, ped=ped, phe=phe, fbat="gee")
##D ...
##D ## whatever you want to do with the results
##D 
##D pbat.unwork( cur ) ## sends you back to where you were
## End(Not run)



