library(aml)


### Name: amltest
### Title: Adaptive Mixed LASSO Analysis
### Aliases: amltest
### Keywords: adaptive mixed LASSO

### ** Examples

     ## analyze the wheat data with main marker effects.
     data("wheat")
     clmarker<- cleanclust(wheat$marker, nafrac=0.2, mafb=0.1, corbnd=0.5, method="complete")
     resmain <- amltest(wheat$y, clmarker$newmarker, wheat$A, numkeep=80, selectvar=40)
     


