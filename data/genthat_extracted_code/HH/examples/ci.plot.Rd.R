library(HH)


### Name: ci.plot
### Title: Plot confidence and prediction intervals for simple linear
###   regression
### Aliases: ci.plot ci.plot.lm
### Keywords: hplot regression

### ** Examples

tmp <- data.frame(x=rnorm(20), y=rnorm(20))
tmp.lm <- lm(y ~ x, data=tmp)
ci.plot(tmp.lm)



