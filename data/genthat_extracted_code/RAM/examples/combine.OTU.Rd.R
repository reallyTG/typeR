library(RAM)


### Name: combine.OTU
### Title: Combine Non Overlapped OTU tables From The Same Community
### Aliases: combine.OTU
### Keywords: datagen

### ** Examples

data(ITS1, ITS2, meta)
meta.new <- head(meta)
## Not run: 
##D # for demonstration purposes only, Not recommend to combine
##D # ITS1 and ITS2 otu tables that both regions were extracted from
##D # long NGS sequences
##D comb <- combine.OTU(data=list(ITS1=ITS1, ITS2=ITS2), meta=meta.new)
##D stopifnot(identical(colnames(comb)[1:(ncol(comb)-1)],
##D                     rownames(meta.new)))
## End(Not run)



