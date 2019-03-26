library(paramlink)


### Name: lod.peaks
### Title: LOD score peaks
### Aliases: lod.peaks

### ** Examples


## minimal example
x = linkdat(toyped, model=1)
res = lod(x)
peak1 = lod.peaks(res, threshold=0)
peak2 = lod.peaks(res, threshold=0, width=2)
peak3 = lod.peaks(res, threshold=1)
stopifnot(length(peak1)==1, nrow(peak1[[1]])==1, length(peak2)==0, length(peak3)==0)




