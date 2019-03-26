library(mixlm)


### Name: CIgrandMean
### Title: Confidence interval for the grand mean of a linear model
### Aliases: CIgrandMean print.CIgm
### Keywords: Confidence interval Linear model

### ** Examples

dataset   <- data.frame(y=rnorm(8), x=factor(c(rep(1,4),rep(0,4))), z=factor(rep(c(1,0),4)))
mixlm <- lm(y~x*r(z), data = dataset)
CIgrandMean(mixlm)



