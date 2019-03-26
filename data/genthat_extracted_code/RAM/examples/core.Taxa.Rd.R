library(RAM)


### Name: core.Taxa
### Title: Show Summary of Core Taxa
### Aliases: core.Taxa
### Keywords: datagen

### ** Examples

data(ITS1, meta)
# taxa shared by 50 percent samples of each city
core <- core.Taxa(data=list(ITS1=ITS1), is.OTU=TRUE, meta=meta,
                  rank="g", meta.factor="City", percent=0.5)
## Not run: 
##D data(ITS1, ITS2, meta)
##D core <- core.Taxa(data=list(ITS1=ITS1, ITS2=ITS2), is.OTU=TRUE,
##D                   meta=meta, rank="g", meta.factor="City",
##D                   percent=0.7)
##D # use taxonomy abundance matrix
##D g1<-tax.abund(ITS1, rank="g")
##D core <- core.Taxa(data=list(genus_ITS1=g1), is.OTU=FALSE, 
##D                   meta=meta, rank="g", meta.factor="City", 
##D                   percent=0.9)
## End(Not run)



