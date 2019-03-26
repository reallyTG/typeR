library(RAM)


### Name: match.data
### Title: Match Samples In Ecology Data Sets and Metadata
### Aliases: match.data
### Keywords: IO file

### ** Examples

## Not run: 
##D data(ITS1, ITS2, meta)
##D meta <- meta[1:8, ]
##D # use otu tables
##D matched <- match.data(data=list(otu_ITS1=ITS1, otu_ITS2=ITS2),
##D            is.OTU=TRUE, meta=meta)
##D # use taxonomy abundance matrices
##D g1 <- tax.abund(ITS1, rank="g")
##D g2 <- tax.abund(ITS2, rank="g")
##D matched <- match.data(data=list(genus_ITS1=g1, genus_ITS2=g2),
##D            is.OTU=FALSE, meta=meta)
##D # class(matched)
##D # names(matched)
## End(Not run)



