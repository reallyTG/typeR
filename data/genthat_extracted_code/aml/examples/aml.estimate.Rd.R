library(aml)


### Name: aml.estimate
### Title: Estimate Genetic Values Using AML Fit
### Aliases: aml.estimate
### Keywords: adaptive mixed LASSO

### ** Examples

     ## estimate genetic values for lines in the wheat data set
     data("wheat")
     clmarker<- cleanclust(wheat$marker, nafrac=0.2, mafb=0.1, corbnd=0.5, method="complete")
     intermat <- epigen(wheat$y, clmarker$newmarker, wheat$A, numkeep=100, selectvar=30, 
                          corbnd=0.5, mafb=0.04)
     resepi <- amltest(wheat$y, intermat$effects, wheat$A, numkeep=80, selectvar=40)
     predall<-aml.estimate(resepi, intermat$effects, wheat$y, wheat$A)
     
     


