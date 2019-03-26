library(ergm)


### Name: logLik.ergm
### Title: A 'logLik' method for 'ergm' fits.
### Aliases: logLik.ergm
### Keywords: models

### ** Examples


# See help(ergm) for a description of this model. The likelihood will
# not be evaluated.
data(florentine)
## Not run: 
##D # The default maximum number of iterations is currently 20. We'll only
##D # use 2 here for speed's sake.
##D gest <- ergm(flomarriage ~ kstar(1:2) + absdiff("wealth") + triangle, eval.loglik=FALSE)
##D 
##D gest <- ergm(flomarriage ~ kstar(1:2) + absdiff("wealth") + triangle, eval.loglik=FALSE,
##D              control=control.ergm(MCMLE.maxit=2))
##D # Log-likelihood is not evaluated, so no deviance, AIC, or BIC:
##D summary(gest)
##D # Evaluate the log-likelihood and attach it to the object.
##D 
##D # The default number of bridges is currently 20. We'll only use 3 here
##D # for speed's sake.
##D gest.logLik <- logLik(gest, add=TRUE)
##D 
##D gest.logLik <- logLik(gest, add=TRUE, control=control.logLik.ergm(nsteps=3))
##D # Deviances, AIC, and BIC are now shown:
##D summary(gest.logLik)
##D # Null model likelihood can also be evaluated, but not for all constraints:
##D logLikNull(gest) # == network.dyadcount(flomarriage)*log(1/2)
## End(Not run)




