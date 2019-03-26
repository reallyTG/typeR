library(saasCNV)


### Name: merging.segments
### Title: Merge Adjacent Segments
### Aliases: merging.segments
### Keywords: merge segmentation

### ** Examples

data(seq.data)
data(seq.segs)

## Not run: 
##D seq.segs.merge <- merging.segments(data=seq.data, segs.stat=seq.segs, 
##D                                  use.null.data=TRUE,
##D                                  N=1000, maxL=2000, 
##D                                  merge.pvalue.cutoff=0.05, verbose=TRUE)
## End(Not run)

## how the results look like
data(seq.segs.merge)
head(seq.segs.merge) 



