library(BayesMed)


### Name: BayesMed
### Title: A default Bayesian hypothesis test for mediation, correlation,
###   and partial correlation.
### Aliases: BayesMed

### ** Examples

## Not run: 
##D # simulate mediational data
##D X <- rnorm(50,0,1)
##D M <- .5*X + rnorm(50,0,1)
##D Y <- .3*X + .6*M + rnorm(50,0,1)
##D 
##D ###########
##D 
##D # run jzs_med to perform the Bayesian hypothesis test for mediation
##D 
##D result <- jzs_med(independent=X,dependent=Y,mediator=M)
##D result
##D 
##D ### NOTE ###
##D #Sometimes this error will pop up:
##D #
##D #Error in solve.default(nItheta) : 
##D #  system is computationally singular: reciprocal condition number = *some small number*
##D #Error in mydt2(0, mT, sT, dfT) : unused arguments (mT, sT, dfT)
##D #In addition: Warning message:
##D #In jzs_medSD(X, Y, M) :
##D #  fit.st did not converge. Alternative optimization method was used.
##D #  
##D #If this happens, just run jzs_medSD() again. 
##D #This usually solves the convergence problem. If it does not,
##D #try a different SD method. For instance: jzs_medSD(X,Y,M,SDmethod="dnorm").
##D #
##D #############
##D 
##D # plot results
##D plot(result$main_result)
##D 
##D # plot posterior samples including credible interval, mean, and median 
##D # of the indirect effect alpha*beta
##D plot(result$ab_samples)
##D 
##D # inspect separate posterior distributions of alpha, beta, and tau_prime
##D plot(result$alpha_samples)
##D plot(result$beta_samples)
##D plot(result$tau_prime_samples)
##D 
##D # print a traceplot of the chains
##D # where the first chain (theta[1]) is for tau' and the second chain (theta[2]) for beta
##D plot(result$jagssamplesA)
##D plot(result$jagssamplesTB) 
##D 
##D ###########
##D 
##D # run jzs_medSD to perform the Savage-Dickey (SD) Bayesian hypothesis test for mediation
##D 
##D result_SD <- jzs_medSD(independent=X,dependent=Y,mediator=M)
##D result_SD
##D 
##D # plot(results)
##D plot(result_SD$main_result)
##D 
##D # plot posterior samples 
##D # including credible interval, mean, and median of the indirect effect alpha*beta
##D plot(result_SD$ab_samples)
##D 
##D # inspect separate posterior distributions of alpha, beta, and tau_prime
##D plot(result_SD$alpha_samples)
##D plot(result_SD$beta_samples)
##D plot(result_SD$tau_prime_samples)
##D 
##D # print a traceplot of the chains
##D # where the first chain (theta[1]) is for tau' and the second chain (theta[2]) for beta
##D plot(result_SD$jagssamplesA)
##D plot(result_SD$jagssamplesTB) 
## End(Not run)



