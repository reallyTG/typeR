library(DescTools)


### Name: KrippAlpha
### Title: Krippendorff's Alpha Reliability Coefficient
### Aliases: KrippAlpha
### Keywords: misc

### ** Examples
# the "C" data from Krippendorff
 nmm <- matrix(c(1,1,NA,1,2,2,3,2,3,3,3,3,3,3,3,3,2,2,2,2,1,2,3,4,4,4,4,4,
                 1,1,2,1,2,2,2,2,NA,5,5,5,NA,NA,1,1,NA,NA,3,NA), nrow=4)
 
 # first assume the default nominal classification
 KrippAlpha(nmm)
 
 # now use the same data with the other three methods
 KrippAlpha(nmm, "ordinal")
 KrippAlpha(nmm, "interval")
 KrippAlpha(nmm, "ratio") 



