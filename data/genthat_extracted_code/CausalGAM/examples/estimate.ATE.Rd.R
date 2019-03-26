library(CausalGAM)


### Name: estimate.ATE
### Title: Estimate Population Average Treatment Effects (ATE) Using
###   Generalized Additive Models
### Aliases: estimate.ATE
### Keywords: models

### ** Examples

## Not run: 
##D ## a simulated data example with Gaussian outcomes
##D ## 
##D 
##D ## number of units in sample
##D n <- 2000
##D 
##D 
##D ## measured potential confounders
##D z1 <- rnorm(n)
##D z2 <- rnorm(n)
##D z3 <- rnorm(n)
##D z4 <- rnorm(n)
##D 
##D ## treatment assignment
##D prob.treated <-	pnorm(-0.5 + 0.75*z2)
##D x <- rbinom(n, 1, prob.treated)
##D 
##D ## potential outcomes
##D y0 <- z4 + rnorm(n)
##D y1 <- z1 + z2 + z3 + cos(z3*2) + rnorm(n)
##D 
##D ## observed outcomes
##D y <- y0
##D y[x==1] <- y1[x==1] 	     	
##D 
##D 
##D ## put everything in a data frame
##D examp.data <- data.frame(z1, z2, z3, z4, x, y)
##D 
##D 
##D ## estimate ATE
##D ##
##D ## in a real example one would want to use a larger number of 
##D ## bootstrap replications
##D ##
##D ATE.out <- estimate.ATE(pscore.formula = x ~ s(z2),
##D                         pscore.family = binomial,
##D                         outcome.formula.t = y ~ s(z1) + s(z2) + s(z3) + s(z4),
##D                         outcome.formula.c = y ~ s(z1) + s(z2) + s(z3) + s(z4),
##D       			outcome.family = gaussian,
##D 			treatment.var = "x",
##D                         data=examp.data,
##D                         divby0.action="t",
##D                         divby0.tol=0.001, 
##D                         var.gam.plot=FALSE,
##D 			nboot=50)      	   	
##D 
##D 
##D ## print summary of estimates
##D print(ATE.out)
##D 
##D 
##D 
##D 
##D ## a simulated data example with Bernoulli outcomes
##D ## 
##D 
##D ## number of units in sample
##D n <- 2000
##D 
##D 
##D ## measured potential confounders
##D z1 <- rnorm(n)
##D z2 <- rnorm(n)
##D z3 <- rnorm(n)
##D z4 <- rnorm(n)
##D 
##D ## treatment assignment
##D prob.treated <-	pnorm(-0.5 + 0.75*z2)
##D x <- rbinom(n, 1, prob.treated)
##D 
##D ## potential outcomes
##D p0 <- pnorm(z4)
##D p1 <- pnorm(z1 + z2 + z3 + cos(z3*2))
##D y0 <- rbinom(n, 1, p0)
##D y1 <- rbinom(n, 1, p1)
##D 
##D ## observed outcomes
##D y <- y0
##D y[x==1] <- y1[x==1] 	     	
##D 
##D 
##D ## put everything in a data frame
##D examp.data <- data.frame(z1, z2, z3, z4, x, y)
##D 
##D 
##D ## estimate ATE
##D ##
##D ## in a real example one would want to use a larger number of 
##D ## bootstrap replications
##D ##
##D ATE.out <- estimate.ATE(pscore.formula = x ~ s(z2),
##D                         pscore.family = binomial,
##D                         outcome.formula.t = y ~ s(z1) + s(z2) + s(z3) + s(z4),
##D                         outcome.formula.c = y ~ s(z1) + s(z2) + s(z3) + s(z4),
##D       			outcome.family = binomial,
##D 			treatment.var = "x",
##D                         data=examp.data,
##D                         divby0.action="t",
##D                         divby0.tol=0.001,
##D                         var.gam.plot=FALSE, 
##D 			nboot=50)      	   	
##D 
##D 
##D ## print summary of estimates
##D print(ATE.out)		     
## End(Not run)



