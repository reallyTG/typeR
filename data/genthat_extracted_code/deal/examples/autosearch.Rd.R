library(deal)


### Name: autosearch
### Title: Greedy search
### Aliases: autosearch heuristic gettable
### Keywords: models

### ** Examples

data(rats)
fit       <- network(rats)
fit.prior <- jointprior(fit,12)
fit       <- getnetwork(learn(fit,rats,fit.prior))
fit       <- getnetwork(insert(fit,2,1,rats,fit.prior))
fit       <- getnetwork(insert(fit,1,3,rats,fit.prior))
hisc      <- autosearch(fit,rats,fit.prior,trace=FALSE)
hisc      <- autosearch(fit,rats,fit.prior,trace=FALSE,removecycles=TRUE) # slower
plot(getnetwork(hisc))

hisc2     <- heuristic(fit,rats,fit.prior,restart=10,trace=FALSE)
plot(getnetwork(hisc2))
print(modelstring(getnetwork(hisc2)))
plot(makenw(gettable(hisc2),fit))



