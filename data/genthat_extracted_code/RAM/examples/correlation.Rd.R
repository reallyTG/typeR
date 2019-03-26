library(RAM)


### Name: correlation
### Title: Plot Of Correlation Coefficient
### Aliases: correlation
### Keywords: hplot

### ** Examples

data(ITS1, meta)
# only plot the first 10 OTUs
sel <- rownames(ITS1)[1:10]
correlation(data=ITS1, meta=meta, is.OTU=TRUE, sel.OTU=TRUE,
            sel=sel)
## Not run: 
##D sel <- c("Fusarium", "Cladosporium", "Alternaria")
##D correlation(data=ITS1, meta=meta, is.OTU=TRUE, sel.OTU=FALSE,
##D             sel=sel, rank="g", data.trans="total",
##D             file="test.pdf", ext="pdf")
## End(Not run)



