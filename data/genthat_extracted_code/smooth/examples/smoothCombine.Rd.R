library(smooth)


### Name: smoothCombine
### Title: Combination of forecasts of state space models
### Aliases: smoothCombine
### Keywords: models nonlinear regression smooth ts univar

### ** Examples


library(Mcomp)

ourModel <- smoothCombine(M3[[578]],intervals="p")
plot(ourModel)

# models parameter accepts either previously estimated smoothCombine
# or a manually formed list of smooth models estimated in sample:
smoothCombine(M3[[578]],models=ourModel)

## Not run: 
##D models <- list(es(M3[[578]]), sma(M3[[578]]))
##D smoothCombine(M3[[578]],models=models)
## End(Not run)




