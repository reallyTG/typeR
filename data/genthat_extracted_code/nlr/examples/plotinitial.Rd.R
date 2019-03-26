library(nlr)


### Name: plotinitial
### Title: Initial Values plot.
### Aliases: plotinitial
### Keywords: Initial Values

### ** Examples

## 
## Plot initial values from selfStart of Scaled Exponential Convex for carbon data
##
  crbdt<-list(xr=nlr::carbon$year,yr=nlr::carbon$co2)
  	plotinitial(form = nlrobj5[[8]],data = crbdt)



