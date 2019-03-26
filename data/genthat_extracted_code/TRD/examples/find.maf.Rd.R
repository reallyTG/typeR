library(TRD)


### Name: find.maf
### Title: Find minor allele frequency (MAF) in case-trios, control-trios,
###   or the whole sample.
### Aliases: find.maf

### ** Examples

trios=rtrios(100000,500,0.1,0.2,0.3,1,0.5,0.5,0.1)
find.maf(trios$case)
find.maf(trios$ctrl)
find.maf(rbind(trios$case,trios$ctrl))



