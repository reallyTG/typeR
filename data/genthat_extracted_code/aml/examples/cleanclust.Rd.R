library(aml)


### Name: cleanclust
### Title: Clean, Impute, and Filter Markers
### Aliases: cleanclust
### Keywords: adaptive mixed LASSO

### ** Examples

     ## process the markers in the wheat data set.
     data("wheat")
     clmarker<- cleanclust(wheat$marker, nafrac=0.2, mafb=0.1, corbnd=0.5, method="complete")

     
     


