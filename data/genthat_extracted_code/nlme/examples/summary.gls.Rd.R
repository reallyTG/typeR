library(nlme)


### Name: summary.gls
### Title: Summarize a Generalized Least Squares 'gls' Object
### Aliases: summary.gls
### Keywords: models

### ** Examples

fm1 <- gls(follicles ~ sin(2*pi*Time) + cos(2*pi*Time), Ovary,
           correlation = corAR1(form = ~ 1 | Mare))
summary(fm1)
coef(summary(fm1)) # "the matrix"



