library(EasyMARK)


### Name: MARK.MCMC
### Title: Mark Gibbs sampler
### Aliases: MARK.MCMC
### Keywords: models

### ** Examples


#' Example 1 perfect detection 
## Not run: 
##D 
##D #' generate some data to input into our simulator  
##D N = 100
##D #' Two traits
##D x1 = rnorm(N,0,1)
##D x2 = rnorm(N,0,1)
##D 
##D #' Use our simulator function
##D #' with constant and perfect recapture probability, p.constant = 1
##D #' with positive linear selection on trait x1 and no selection on trait x2
##D chObj = Simulate.CH(surv.form = 1 + 0.15*x1 + 0*x2, p.constant = 1, N = N)
##D str(chObj) #' what is contained in our chObj
##D 
##D ch = chObj$ch #' Let's pull out our simulated capture histories
##D ch #' what it looks like
##D 
##D #' make a data.frame of covariate values
##D cov = data.frame(x1 = x1, x2 = x2) 
##D 
##D #' cov should have the same number of rows as ch
##D nrow(ch)
##D nrow(cov)
##D 
##D #' Now let's estimate the parameters of our simulated data.
##D #' And test which model best fits the data.
##D #' We use a small number iteration here, 
##D #' n.iter = 1000, so it runs quickly. 
##D #' One should definitely use many more iterations in practice. 
##D #' We we throw away half of our n.iter in the the burn in, burn.in = 500
##D MCMC = MARK.MCMC(ch = ch, cov = cov, n.iter = 1000, burn.in = 500, number.of.models = 5, 
##D n.chains = 2, add = TRUE, quad = TRUE, corr = TRUE)
##D 
##D #' Let's look at what is inside our MCMC object
##D attributes(MCMC)
##D 
##D #' Let's look at the posterior probability, pp
##D #' Since we did not run very many iterations, the correct model (x1),
##D #' may not have the highest probability
##D MCMC$pp
##D 
##D #' Let's look at the recapture probability
##D #' Since we set it at 1, it should be close to 1 
##D MCMC$p
##D 
##D #' Let's look at our estimates of our parameters.
##D #' Since we set the gradient on trait x1 to 0.15, x1's parameters should be close to 0.15
##D #' However, our estimates may not be very good, since we used so few iterations 
##D MCMC$estimates
##D 
##D #' Let's look at our convergence diagnostic
##D #' These values should be close to 1 for all beta variables and p
##D #' w and sigmaeps can mostly be ignored 
##D #' See gelman.diag in the coda library for more details. 
##D MCMC$gelman
##D 
##D 
##D #' Example 2 imperfect detection 
##D #' Same procedure as in Example 1
##D N = 100
##D x1 = rnorm(N,0,1)
##D x2 = rnorm(N,0,1)
##D 
##D #' Only this time we will lower our recapture probability, p.constant, from 1 to 0.5
##D chObj = Simulate.CH(surv.form = 1 + 0.15*x1 + 0*x2, p.constant = 0.5, N = N)
##D ch = chObj$ch 
##D 
##D cov = data.frame(x1 = x1, x2 = x2) 
##D MCMC = MARK.MCMC(ch = ch, cov = cov, n.iter = 1000, burn.in = 500, number.of.models = 5, 
##D n.chains = 2, add = TRUE, quad = TRUE, corr = TRUE)
##D 
##D #' look at our output
##D MCMC$pp
##D #' p should be close to 0.5
##D MCMC$p
##D MCMC$estimates
##D MCMC$gelman
##D 
##D 
##D #' Example 3 Test Only Addative Models
##D #' Same as before...
##D N = 100
##D x1 = rnorm(N,0,1)
##D x2 = rnorm(N,0,1)
##D 
##D #' Only this time we will lower our recapture probability, p.constant, from 1 to 0.5
##D chObj = Simulate.CH(surv.form = 1 + 0.15*x1 + 0*x2, p.constant = 0.5, N = N)
##D ch = chObj$ch 
##D 
##D cov = data.frame(x1 = x1, x2 = x2) 
##D #' Now we set quad = FALSE, corr = FALSE
##D MCMC = MARK.MCMC(ch = ch, cov = cov, n.iter = 1000, burn.in = 500, number.of.models = 5,
##D n.chains = 2, add = TRUE, quad = FALSE, corr = FALSE)
##D 
##D #' Let's look at the posterior probability  
##D #' It should only show the four possible addative models and blank slots for the rest
##D #' x1 should have the highest pp, since our data was simulated under those conditions
##D MCMC$pp
##D 
##D 
##D #' Example 3 Stabilizing selection
##D #' We will bump up the sample size to 500,
##D #' since stabilizing selection is  a little bit harder 
##D #' to detect with small sample sizes
##D N = 500
##D x1 = rnorm(N,0,1)
##D 
##D #' For stabilizing selection, we will add a term to our simulator: -0.15*x1^2
##D #' We will keep our recapture probability at an high value
##D chObj = Simulate.CH(surv.form = 1 + 0*x1 + -0.3*x1^2, p.constant = 0.7, N = N)
##D ch = chObj$ch 
##D 
##D cov = data.frame(x1 = x1) 
##D 
##D #' We will set corr = FALSE, since we only have one trait, x1
##D #' May take a few minutes ~5 minutes to run...
##D MCMC = MARK.MCMC(ch = ch, cov = cov, n.iter = 1000, burn.in = 500, number.of.models = 5, 
##D n.chains = 2, add = TRUE, quad = TRUE, corr = FALSE)
##D 
##D #' Let's look at the posterior probability  
##D #' x1^2 should be the model with the higher posterior probability 
##D MCMC$pp
##D 
##D #' x1^2 term should have an estimate close to -0.3
##D MCMC$estimates
## End(Not run)





