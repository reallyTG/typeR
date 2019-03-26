library(gmnl)


### Name: effect.gmnl
### Title: Get the Conditional Individual Coefficients
### Aliases: effect.gmnl

### ** Examples

## Not run: 
##D ## Data
##D data("TravelMode", package = "AER")
##D library(mlogit)
##D TM <- mlogit.data(TravelMode, choice = "choice", shape = "long", 
##D                  alt.levels = c("air", "train", "bus", "car"), chid.var = "individual")
##D                  
##D ## MIXL model with observed heterogeneity
##D mixl.hier <- gmnl(choice ~ vcost + gcost + travel + wait | 1 | 0 | income + size - 1,
##D                  data = TM,
##D                  model = "mixl",
##D                  ranp = c(travel = "t", wait = "n"),
##D                  mvar = list(travel = c("income","size"), wait = c("income")),
##D                  R = 30,
##D                  haltons = list("primes"= c(2, 17), "drop" = rep(19, 2)))
##D                  
##D ## Get the individuals' conditional mean and their standard errors for lwage
##D bi.travel <- effect.gmnl(mixl.hier, par = "travel", effect = "ce")
##D summary(bi.travel$mean)
##D summary(bi.travel$sd.est)
##D 
##D ## Get the individuals' conditional WTP of travel with respect to gcost
##D wtp.travel <- effect.gmnl(mixl.hier, par = "travel", effect = "wtp", wrt = "gcost")
##D summary(wtp.travel$mean)
##D summary(wtp.travel$sd.est)
## End(Not run) 



