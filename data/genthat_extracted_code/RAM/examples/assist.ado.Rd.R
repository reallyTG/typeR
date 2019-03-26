library(RAM)


### Name: assist.ado
### Title: Perform ADONIS Analysis for OTU Tables Or Taxonomic Abundance
###   Matrix
### Aliases: assist.ado
### Keywords: models

### ** Examples

data(ITS1, meta)
## Not run: 
##D # test OTUs
##D data <- list(ITS1=ITS1, ITS2=ITS2)
##D assist.ado(data=data, is.OTU=TRUE,meta=meta, ranks=NULL,
##D            data.trans="log", dist=NULL)
##D # test taxa at different ranks
##D ranks <- c("p", "c", "o", "f", "g")
##D ado <- assist.ado(data=data, is.OTU=TRUE, 
##D                   meta=meta, ranks=ranks,
##D                   data.trans="log", dist="bray" )
##D # test genera
##D g1 <- tax.abund(otu1=ITS1, rank="g", drop.unclassified=TRUE)
##D data <- list(g1=g1)
##D assist.ado(data=data, is.OTU=FALSE, 
##D            meta=meta, ranks=NULL,
##D            data.trans="log", dist="bray" )
## End(Not run)



