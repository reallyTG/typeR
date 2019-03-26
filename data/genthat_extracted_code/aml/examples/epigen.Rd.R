library(aml)


### Name: epigen
### Title: Generate Epistatic Effect Matrix
### Aliases: epigen
### Keywords: adaptive mixed LASSO

### ** Examples

     ## process the markers in the wheat data set.
     data("wheat")
     clmarker<- cleanclust(wheat$marker, nafrac=0.2, mafb=0.1, corbnd=0.5, method="complete")
     intermat <- epigen(wheat$y, clmarker$newmarker, wheat$A, numkeep=100, selectvar=30, 
                        corbnd=0.5, mafb=0.04)
     


