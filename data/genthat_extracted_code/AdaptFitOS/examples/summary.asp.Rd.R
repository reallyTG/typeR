library(AdaptFitOS)


### Name: summary.asp
### Title: Summaries and hypothesis tests
### Aliases: summary.asp
### Keywords: models smooth regression

### ** Examples

data(onions,package="SemiPar")
attach(onions)
log.yield <- log(yield)
fit <- asp2(log.yield~location+f(dens, degree=c(3,2)))
summary(fit,test1=TRUE,test2=TRUE)



