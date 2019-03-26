library(saasCNV)


### Name: cnv.call
### Title: CNV Calling from Sequencing Data
### Aliases: cnv.call
### Keywords: CNV CNV call

### ** Examples

data(seq.data)
data(seq.segs.merge)

## Not run: 
##D seq.cnv <- cnv.call(data=seq.data, sample.id="PT116", 
##D                     segs.stat=seq.segs.merge, maxL=2000, N=1000,
##D                     pvalue.cutoff=0.05)
## End(Not run)

## how the results look like
data(seq.cnv)
head(seq.cnv)



