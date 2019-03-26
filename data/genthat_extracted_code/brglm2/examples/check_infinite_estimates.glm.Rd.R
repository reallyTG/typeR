library(brglm2)


### Name: check_infinite_estimates.glm
### Title: A simple diagnostic of whether the maximum likelihood estimates
###   are infinite
### Aliases: check_infinite_estimates.glm checkInfiniteEstimates

### ** Examples


## endometrial data from Heinze \& Schemper (2002) (see ?endometrial)
data("endometrial", package = "brglm2")
endometrialML <- glm(HG ~ NV + PI + EH, data = endometrial,
                     family = binomial("probit"))
## clearly the maximum likelihood estimate for the coefficient of
## NV is infinite
check_infinite_estimates(endometrialML)

## Not run: 
##D ## Aligator data (Agresti, 2002, Table~7.1)
##D data("alligator", package = "brglm2")
##D all_ml <- brmultinom(foodchoice ~ size + lake , weights = round(freq/3),
##D                      data = alligators, type = "ML", ref = 1)
##D ## Clearly some estimated standard errors diverge as the number of
##D ## Fisher scoring iterations increases
##D matplot(check_infinite_estimates(all_ml), type = "l", lty = 1,
##D         ylim = c(0.5, 1.5))
## End(Not run)



