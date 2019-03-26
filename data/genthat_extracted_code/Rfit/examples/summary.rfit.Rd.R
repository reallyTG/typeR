library(Rfit)


### Name: summary.rfit
### Title: Summarize Rank-Based Linear Model Fits
### Aliases: summary.rfit

### ** Examples

data(baseball)
fit<-rfit(weight~height,data=baseball)
summary(fit)
summary(fit,overall.test='drop')



