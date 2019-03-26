library(GUTS)


### Name: GUTS
### Title: Fast Calculation of the Likelihood of a Stochastic Survival
###   Model
### Aliases: GUTS guts guts_setup guts_calc_loglikelihood
###   guts_calc_survivalprobs

### ** Examples

data(diazinon)

gts <- guts_setup(C = diazinon$C1, Ct = diazinon$Ct1,
	y = diazinon$y1, yt = diazinon$yt1)

guts_calc_loglikelihood(gts, c(0.05084761, 0.12641525,
	1.61840054, 19.09911, 6.495246)) # -183.566.
guts_calc_survivalprobs(gts, rep(.5, 5)) # 1.000000e+00 1.737352e-05 ... 1.674316e-33

guts_calc_loglikelihood(gts, -1:3) # Warning.
gts

## Not run: guts_calc_survivalprobs( gts, 1:4 ) # Error.

## Not run: gts[["C"]] <- 1:3 # Error.



