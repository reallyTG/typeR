library(fda.usc)


### Name: CV.S
### Title: The cross-validation (CV) score
### Aliases: CV.S
### Keywords: utilities

### ** Examples


data(tecator)
x<-tecator$absorp.fdata
np<-ncol(x)
tt<-1:np
 S1 <- S.NW(tt,3,Ker.epa)
 S2 <- S.LLR(tt,3,Ker.epa)
 S3 <- S.NW(tt,5,Ker.epa)
 S4 <- S.LLR(tt,5,Ker.epa)
 cv1 <- CV.S(x, S1)
 cv2 <- CV.S(x, S2)
 cv3 <- CV.S(x, S3)
 cv4 <- CV.S(x, S4)
 cv5 <- CV.S(x, S4,trim=0.1,draw=TRUE)
 cv1;cv2;cv3;cv4;cv5
 S6 <- S.KNN(tt,1,Ker.unif,cv=TRUE)
 S7 <- S.KNN(tt,5,Ker.unif,cv=TRUE)
 cv6 <- CV.S(x, S6)
 cv7 <- CV.S(x, S7)
 cv6;cv7
 


