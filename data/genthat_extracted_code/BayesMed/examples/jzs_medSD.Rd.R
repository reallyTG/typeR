library(BayesMed)


### Name: jzs_medSD
### Title: Perform a default Bayesian hypothesis test for mediation using
###   the Savage-Dickey method.
### Aliases: jzs_medSD

### ** Examples

## Not run: 
##D 
##D # simulated mediational data
##D a <- .5 
##D b <- .6
##D t_prime <- .3
##D 
##D X <- rnorm(50,0,1)
##D M <- a*X + rnorm(50,0,1)
##D Y <- t_prime*X + b*M + rnorm(50,0,1)
##D 
##D # run jzs_medSD
##D result <- jzs_medSD(independent=X,dependent=Y,mediator=M)
##D 
##D # print result
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
##D #------------------------------------------
##D 
##D # load Firefighter data
##D data(Firefighters)
##D 
##D X <- Firefighters$x
##D M <- Firefighters$m
##D Y <- Firefighters$y
##D 
##D # run jzs_medSD
##D result <- jzs_medSD(independent=X,dependent=Y,mediator=M)
##D 
##D # plot the result in a mediation diagram
##D plot(result$main_result)
##D 
##D # inspect posterior distribution of the coefficients
##D plot(result$alpha_samples)
##D plot(result$beta_samples)
##D plot(result$tau_prime_samples)
##D 
##D # print a traceplot of the chains
##D plot(result$jagssamplesA)
##D plot(result$jagssamplesTB) 
##D # where the first chain (theta[1]) is for tau' and the second chain (theta[2]) for beta
##D 
##D # calculate and plot a 95% credible interval for the 
##D # posterior mean of the indirect effect
##D result$CI_ab
##D plot(result$ab_samples)
##D 
##D 
## End(Not run)



