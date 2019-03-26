library(ICBayes)


### Name: SurvtoLR
### Title: Transform Surv object to data matrix with L and R columns
### Aliases: SurvtoLR

### ** Examples

library(survival)
L<-c(45,6,0,46)
R<-c(NA,10,7,NA)
y<-Surv(L,R,type='interval2')
SurvtoLR(y)



