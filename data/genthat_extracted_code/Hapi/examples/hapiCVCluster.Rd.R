library(Hapi)


### Name: hapiCVCluster
### Title: Filter out hetSNPs in potential complex regions
### Aliases: hapiCVCluster

### ** Examples

ref <- rep(0,500)
alt <- rep(1,500)

imputedFrame <- data.frame(gmt1=ref, gmt2=alt, gmt3=ref,
gmt4=ref, gmt5=c(alt[1:250], ref[251:500]),
stringsAsFactors = FALSE)

draftHap <- hapiPhase(imputedFrame)
cvCluster <- hapiCVCluster(draftHap = draftHap, cvlink=2)



