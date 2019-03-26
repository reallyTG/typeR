library(optiRum)


### Name: giniChart
### Title: Produce a ROC curve with gini coefficient title
### Aliases: giniChart
### Keywords: AUROC gini roc

### ** Examples

  sampledata<- data.frame(val= rnorm(100) , outcome=rbinom(100,1,.8))
  giniChart(sampledata$val,sampledata$outcome)
  



