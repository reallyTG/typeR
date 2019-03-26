library(alphaOutlier)


### Name: aout.hyper
### Title: Find alpha-outliers in hypergeometric data
### Aliases: aout.hyper
### Keywords: distribution

### ** Examples

set.seed(1)
lotto6aus49 <- rhyper(100, 6, 43, 6) 
aout.hyper(lotto6aus49, c(6, 43, 6), 0.1)



