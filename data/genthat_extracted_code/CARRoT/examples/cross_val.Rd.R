library(CARRoT)


### Name: cross_val
### Title: Cross-validation run
### Aliases: cross_val

### ** Examples

#creating variables

vari<-matrix(c(1:100,seq(1,300,3)),ncol=2)

#creating outcomes

out<-rbinom(100,1,0.3)

#creating array for predictions

preds<-array(NA,c(2,2))

#running the function

cross_val(vari,out,1:2,10,10,100,c(1,1),2,preds,'binary','det','exact',0.5,'acc',nr=c(1,4))



