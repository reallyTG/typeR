library(RAM)


### Name: group.indicators
### Title: Plot Indicator Taxon Groups for Metadata Trends
### Aliases: group.indicators
### Keywords: hplot

### ** Examples

data(ITS1, ITS2, meta)
## Not run: 
##D # inputs are OTU tables
##D group.indicators(data=list(ITS1=ITS1, ITS2=ITS2), is.OTU=TRUE, 
##D                  meta, factor = c(Province="Province"),
##D                  rank="g")
##D group.indicators(data=list(ITS1=ITS1), is.OTU=TRUE, meta,
##D                      factor = c(Province="Province"),
##D                      rank=NULL)
##D group.indicators(data=list(ITS1=ITS1), is.OTU=TRUE, meta,
##D                      factor = c(Province="Province"),
##D                      rank=NULL)
##D # inputs are taxonomic abundance matrices
##D g1 <- tax.abund(ITS1, rank="g")
##D g2 <- tax.abund(ITS2, rank="g")
##D group.indicators(data=list(g1=g1, g2=g2), is.OTU=FALSE, meta,
##D                      factor = c(Province="Province"),
##D                      rank="g")
## End(Not run)



