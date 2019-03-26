library(HH)


### Name: lmplot
### Title: Four types of residual plots for linear models.
### Aliases: lmplot
### Keywords: dplot

### ** Examples

tmp <- data.frame(y=rnorm(100), x1=rnorm(100), x2=rnorm(100))
tmp.lm <- lm(y ~ x1 + x2, data=tmp)
lmplot(tmp.lm)



