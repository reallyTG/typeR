library(RAM)


### Name: RAM.input.formatting
### Title: Data Input Formatting
### Aliases: RAM.input.formatting

### ** Examples

data(ITS1, ITS2, meta)
# use otu tables
matched <- match.data(data=list(otu_ITS1=ITS1, otu_ITS2=ITS2),
           is.OTU=TRUE, meta=meta)
# taxonomy abundance matrices
g1 <- tax.abund(ITS1, rank="g")
g2 <- tax.abund(ITS2, rank="g")
matched <- match.data(data=list(genus_ITS1=g1, genus_ITS2=g2),
           is.OTU=FALSE, meta=meta)



