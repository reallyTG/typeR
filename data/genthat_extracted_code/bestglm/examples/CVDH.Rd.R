library(bestglm)


### Name: CVDH
### Title: Adjusted K-fold Cross-Validation
### Aliases: CVDH
### Keywords: models regression

### ** Examples

#Example 1. Variability in 10-fold CV with Davison-Hartigan Algorithm.
#Plot the CVs obtained by using 10-fold CV on the best subset
#model of size 2 for the prostate data. We assume the best model is
#the model with the first two inputs and then we compute the CV's
#using 10-fold CV, 100 times. The result is summarized by a boxplot as well 
#as the sd.
NUMSIM<-10
data(zprostate)
train<-(zprostate[zprostate[,10],])[,-10]
X<-train[,1:2]
y<-train[,9]
cvs<-numeric(NUMSIM)
set.seed(123321123)
for (isim in 1:NUMSIM)
    cvs[isim]<-CVDH(X,y,K=10,REP=1)[1]
summary(cvs)



