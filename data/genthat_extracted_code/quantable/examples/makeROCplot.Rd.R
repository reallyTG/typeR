library(quantable)


### Name: makeROCplot
### Title: create density plots of cases and controls and ROC plot
### Aliases: makeROCplot

### ** Examples

library(pROC)
cases <- rnorm(100,-1,1.5)
controls <- rnorm(300,1,1.5)
makeROCplot(cases,controls)




