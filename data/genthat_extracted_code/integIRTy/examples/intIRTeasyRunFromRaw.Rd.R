library(integIRTy)


### Name: intIRTeasyRunFromRaw
### Title: The easyrun function for integrating multiple modalities of high
###   throughput assays using raw data.
### Aliases: intIRTeasyRunFromRaw
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(OV)
# 
controlList <- list(Expr_N, Methy_N, CN_N)
tumorList <- list(Expr_T, Methy_T, CN_T)
# not run as it takes time
#runFromRaw <- intIRTeasyRunFromRaw(platforms=tumorList, 
#		platformsCtr=controlList, 
#		assayType=c("Expr", "Methy", "CN"), 
#		permutationMethod="gene sampling")



