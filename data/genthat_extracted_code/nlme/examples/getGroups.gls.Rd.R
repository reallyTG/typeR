library(nlme)


### Name: getGroups.gls
### Title: Extract gls Object Groups
### Aliases: getGroups.gls
### Keywords: models

### ** Examples

fm1 <- gls(follicles ~ sin(2*pi*Time) + cos(2*pi*Time), Ovary,
           correlation = corAR1(form = ~ 1 | Mare))
getGroups(fm1)



