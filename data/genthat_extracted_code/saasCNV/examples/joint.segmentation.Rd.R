library(saasCNV)


### Name: joint.segmentation
### Title: Joint Segmentation on log2ratio and log2mBAF Dimensions
### Aliases: joint.segmentation
### Keywords: joint segmentation CBS segmentation

### ** Examples

data(seq.data)

## Not run: 
##D seq.segs <- joint.segmentation(data=seq.data, min.snps=10, 
##D                                global.pval.cutoff=1e-4, max.chpts=30, 
##D                                verbose=TRUE)
## End(Not run)

## how the joint segmentation results look like
data(seq.segs)
head(seq.segs)



