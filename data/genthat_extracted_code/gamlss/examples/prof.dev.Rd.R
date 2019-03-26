library(gamlss)


### Name: prof.dev
### Title: Plotting the Profile Deviance for one of the Parameters in a
###   GAMLSS model
### Aliases: prof.dev
### Keywords: regression

### ** Examples

## Not run: 
##D data(abdom)
##D h<-gamlss(y~pb(x), sigma.formula=~pb(x), family=BCT, data=abdom) 
##D prof.dev(h,"nu",min=-2.000,max=2)
##D rm(h)
## End(Not run)



