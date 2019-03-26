library(Hmisc)


### Name: symbol.freq
### Title: Graphic Representation of a Frequency Table
### Aliases: symbol.freq
### Keywords: hplot

### ** Examples

## Not run: 
##D getHdata(titanic)
##D attach(titanic)
##D age.tertile <- cut2(titanic$age, g=3)
##D symbol.freq(age.tertile, pclass, marginals=T, srtx=45)
##D detach(2)
## End(Not run)


