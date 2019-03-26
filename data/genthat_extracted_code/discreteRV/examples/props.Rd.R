library(discreteRV)


### Name: props
### Title: Proportions of observed outcomes in one or more vectors of
###   simulated trials
### Aliases: props

### ** Examples

X.Bern <- RV(c(1,0), c(.5,.5))
X.Bern.sim100 <- rsim(X.Bern, 100)

X.loaded.die <- RV(1:6, odds = c(1,1,1,1,2,4))
X.loaded.die.sim100 <- rsim(X.loaded.die, 100)
props(X.Bern.sim100)
props(X.loaded.die.sim100)
# Note: 'props()' is the analog of 'probs()', but
#       'props()' applies to SIMULATION DATA and tabulates them, whereas
#       'probs()' applies to RANDOM VARIABLES and lists their probabilities.
#       By the LLN the results of 'props()' will be close to 'probs()' for
#       for large simulations.



