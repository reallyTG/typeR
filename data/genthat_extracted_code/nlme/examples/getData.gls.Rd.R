library(nlme)


### Name: getData.gls
### Title: Extract gls Object Data
### Aliases: getData.gls getData.gnls
### Keywords: models

### ** Examples

fm1 <- gls(follicles ~ sin(2*pi*Time) + cos(2*pi*Time), data = Ovary,
           correlation = corAR1(form = ~ 1 | Mare))
getData(fm1)



