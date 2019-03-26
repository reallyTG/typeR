library(npExact)


### Name: npMeanSingle
### Title: A test for the mean of a bounded random variable based on a
###   single sample of iid observations.
### Aliases: npMeanSingle
### Keywords: mean sample single test

### ** Examples


## test whether Americans gave more than 5 dollars in a round of
## the Ultimatum game
data(bargaining)
us_offers <- bargaining$US
npMeanSingle(us_offers, mu = 5, lower = 0, upper = 10, alternative =
"greater", ignoreNA = TRUE) ## no rejection

## test if the decrease in pain before and after the surgery is smaller
## than 50
data(pain)
pain$decrease <- with(pain, before - after)
without_pc <- pain[pain$pc == 0, "decrease"]
npMeanSingle(without_pc, mu = 50, lower = 0, upper = 100,
alternative = "less")




