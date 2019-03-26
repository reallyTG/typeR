library(nlme)


### Name: residuals.gls
### Title: Extract gls Residuals
### Aliases: residuals.gls residuals.gnls
### Keywords: models

### ** Examples

fm1 <- gls(follicles ~ sin(2*pi*Time) + cos(2*pi*Time), Ovary,
           correlation = corAR1(form = ~ 1 | Mare))
residuals(fm1)



