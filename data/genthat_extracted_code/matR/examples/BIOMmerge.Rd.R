library(matR)


### Name: BIOMmerge
### Title: Merge BIOM data
### Aliases: merge.biom

### ** Examples

####  merging requires only that all colnames be unique, so nonsense can be performed
merge (xx1, xx4)

####  a more likely example, based on applying different normalizations
aa <- transform (xx4 [,1:8], t_Threshold, t_Log)
bb <- transform (xx4 [,9:16], t_Threshold=list(entry.min=5), t_Log)
xx4_norm <- merge (aa, bb)



