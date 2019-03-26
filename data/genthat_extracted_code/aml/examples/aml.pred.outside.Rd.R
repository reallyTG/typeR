library(aml)


### Name: aml.pred.outside
### Title: Prediction With Adaptive Mixed LASSO
### Aliases: aml.pred.outside
### Keywords: adaptive mixed LASSO

### ** Examples

     ## Predict the phenotype values of ten lines using the rest of the population in the wheat data
     data("wheat")
     clmarker<- cleanclust(wheat$marker, nafrac=0.2, mafb=0.1, corbnd=0.5, method="complete")
     intermat <- epigen(wheat$y, clmarker$newmarker, wheat$A, numkeep=100, selectvar=30, 
                        corbnd=0.5, mafb=0.04)
     which10<- sample(1:282, 10)
     pred10<- aml.pred.outside(intermat$effects, wheat$y, wheat$A, which10, 80, 40)
     
     


