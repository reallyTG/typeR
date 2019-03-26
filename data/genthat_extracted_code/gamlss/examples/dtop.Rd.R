library(gamlss)


### Name: dtop
### Title: Detrended transformed Owen's plot
### Aliases: dtop
### Keywords: ~kwd1

### ** Examples

data(abdom)
a<-gamlss(y~pb(x),sigma.fo=~pb(x,1),family=LO,data=abdom)
dtop(a)
dtop(a, xvar=abdom$x)
rm(a)



