library(WhiteStripe)


### Name: get.deriv.smooth.hist
### Title: Gets $n^th$ derivative of smoothed histogram
### Aliases: get.deriv.smooth.hist

### ** Examples

data(smoothed_histogram)
dy<-get.deriv.smooth.hist(xvals, 
coefs=s.hist$coefs,
knots=s.hist$knots,
deg=s.hist$deg,
deriv.deg=1)



