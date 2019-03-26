library(surveillance)


### Name: hhh4_simulate_scores
### Title: Proper Scoring Rules for Simulations from 'hhh4' Models
### Aliases: scores.hhh4sims scores.hhh4simslist
### Keywords: univar

### ** Examples

data("salmAllOnset")

## fit a hhh4 model to the first 13 years
salmModel <- list(end = list(f = addSeason2formula(~1 + t)),
                  ar = list(f = ~1), family = "NegBin1", subset = 2:678)
salmFit <- hhh4(salmAllOnset, salmModel)

## simulate the next 20 weeks ahead
salmSims <- simulate(salmFit, nsim = 500, seed = 3, subset = 678 + seq_len(20),
                     y.start = observed(salmAllOnset)[678,])

## calculate the RPS at each time point
scores(salmSims, which = "rps")

## produce a PIT histogram based on the empirical distribution function
## of the simulated counts as the forecast distribution at each time point
pit(x = observed(attr(salmSims, "stsObserved")),
    pdistr = apply(salmSims, 1:2, ecdf))



