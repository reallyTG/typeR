library(optiRum)


### Name: giniCoef
### Title: Produce a gini coefficient
### Aliases: giniCoef
### Keywords: AUROC gini roc

### ** Examples

  sampledata<- data.frame(val= rnorm(100) , outcome=rbinom(100,1,.8))
  giniCoef(sampledata$val,sampledata$outcome)
  



