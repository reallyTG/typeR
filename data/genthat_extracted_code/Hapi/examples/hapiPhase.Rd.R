library(Hapi)


### Name: hapiPhase
### Title: Phase draft haplotypes by majority voting
### Aliases: hapiPhase

### ** Examples

ref <- rep(0,500)
alt <- rep(1,500)
imputedFrame <- data.frame(gmt1=ref, gmt2=alt, gmt3=ref, 
gmt4=ref, gmt5=c(alt[1:250], ref[251:500]),
stringsAsFactors = FALSE)
draftHap <- hapiPhase(gmt=imputedFrame)



