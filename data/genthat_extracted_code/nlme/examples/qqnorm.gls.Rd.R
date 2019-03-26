library(nlme)


### Name: qqnorm.gls
### Title: Normal Plot of Residuals from a gls Object
### Aliases: qqnorm.gls
### Keywords: models

### ** Examples

fm1 <- gls(follicles ~ sin(2*pi*Time) + cos(2*pi*Time), Ovary,
           correlation = corAR1(form = ~ 1 | Mare))
qqnorm(fm1, abline = c(0,1))



