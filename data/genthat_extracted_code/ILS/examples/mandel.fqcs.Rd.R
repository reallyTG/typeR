library(ILS)


### Name: mandel.fqcs
### Title: This function is used to compute the FDA Mandel's h and k
###   statistic.
### Aliases: mandel.fqcs mandel.fqcs.default mandel.fqcs.ils.fqcdata

### ** Examples

## Not run: 
##D library(ILS)
##D data(TG)
##D delta <- seq(from = 40 ,to = 850 ,length.out = 1000 )
##D fqcdata <- ils.fqcdata(TG, p = 7, argvals = delta)
##D mandel.tg <- mandel.fqcs(fqcdata.tg,nb = 200)
##D plot(mandel.tg,legend = F,col=c(rep(3,5),1,1))
##D   
## End(Not run)



