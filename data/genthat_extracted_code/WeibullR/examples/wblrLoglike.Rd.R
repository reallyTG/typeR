library(WeibullR)


### Name: wblrLoglike
### Title: Log likelihood for Weibull and Lognormal fitted data including
###   intervals
### Aliases: wblrLoglike
### Keywords: regression reliability

### ** Examples

failures<-c(90,96,30,49,82)
suspensions<-c(100,45,10)
weibull_loglike<-wblrLoglike(c( 2.26, 4900), mleframe(failures,suspensions))



