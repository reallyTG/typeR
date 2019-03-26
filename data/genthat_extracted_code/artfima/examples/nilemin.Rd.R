library(artfima)


### Name: nilemin
### Title: Nile Annual Minima, 622 AD to 1284 AD
### Aliases: nilemin
### Keywords: datasets

### ** Examples

data(nilemin)
artfima(nilemin, likAlg="Whittle")
## Not run: 
##D #compare exact and Whittle using bestModel()
##D start <- proc.time()[3]
##D ans<-bestModel(nilemin)
##D tot <- proc.time()[3]-start
##D start <- proc.time()[3]
##D ansW <- bestModel(nilemin, likAlg="Whittle")
##D totW <- proc.time()[3]-start
##D t <- c(tot, totW)
##D names(t) <- c("exact", "Whittle")
##D #compare times - about 100 seconds vs 3 seconds
##D t
##D #compare best models
##D ans
##D ansW
##D #AIC/BIC scores similar but rankings to change.
##D #ARTFIMA(0,0,0) is ranked best by both AIC and BIC
##D #ARIMA(2,0,1) is ranked second best by both AIC and BIC
##D #ARFIMA(0,0,0) is ranked 3rd by BIC and is not among top 5 by AIC
## End(Not run)



