library(TRD)


### Name: strata.cnt
### Title: Count trios for each of the 15/16 strata with
###   mother-father-child genotypes MFC
### Aliases: strata.cnt

### ** Examples

trios=rtrios(100000,500,0.1,0.2,0.3,1,0.5,0.5,0.1)
strata.cnt(trios$case)
strata.cnt(trios$ctrl)



