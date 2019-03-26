library(RAM)


### Name: filter.META
### Title: Select METADATA Variables
### Aliases: filter.META
### Keywords: manip

### ** Examples

data(meta)
## Not run: 
##D # add a new column with NA
##D meta.nw <- meta
##D meta.nw$na <- c(rep(NA, nrow(meta.nw)-3), c(1, 3, 5))
##D meta.nw$nf <- rep("Canada", nrow(meta.nw))
##D meta.fil <- filter.META(meta.nw)
##D meta.fil <- filter.META(meta.nw, excl.na=FALSE, excl.NNF=FALSE,
##D                         exclude=c("Province", "Latitude"))
## End(Not run)



