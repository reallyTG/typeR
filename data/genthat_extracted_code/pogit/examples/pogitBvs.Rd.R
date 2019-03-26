library(pogit)


### Name: pogitBvs
### Title: Bayesian variable selection for the Pogit model
### Aliases: pogitBvs
### Keywords: models

### ** Examples

## Not run: 
##D ## Examples below (except for m3) should take 3-4 minutes. 
##D 
##D ## ------ (use simul1) ------
##D # load simulated data set 'simul1'
##D data(simul1)
##D y <- simul1$y
##D E <- simul1$E
##D X <- as.matrix(simul1[, -c(1,2,8,9)]) # W = X
##D validation <- simul1[, c("m", "v"), drop = FALSE]
##D 
##D # function call (with specific MCMC settings)
##D m1 <- pogitBvs(y = y, E = E, X = X, validation = validation, 
##D                mcmc = list(M = 4000, thin = 5, verbose = 1000))
##D 
##D # print, summarize and plot results
##D print(m1)
##D summary(m1)
##D plot(m1)
##D 
##D # show traceplots disregarding burn-in and thinning
##D plot(m1, burnin = FALSE, thin = FALSE)
##D # show density plot of MCMC draws
##D plot(m1, type = "density")
##D 
##D # informative prior instead of validation data (change prior settings)
##D # e.g. available prior information on reporting probabilities 
##D p.a0 <- 0.9 
##D p.a  <- c(0.125, 0.5, 0.5, 0.5)
##D m0a_inf <- log(p.a0/(1 - p.a0))  # prior information for alpha_0
##D aj0_inf <- log(p.a/(1 - p.a))    # prior information for alpha
##D 
##D prior.set <- list(m0a = m0a_inf, aj0 = aj0_inf, VL = 0.005, slabL = "Normal")
##D m2 <- pogitBvs(y = y, E = E, X = X, method = "infprior", prior = prior.set, 
##D                mcmc = list(M = 4000, burnin = 2000, thin = 2), BVS = FALSE)
##D print(m2)
##D summary(m2)
##D plot(m2)
##D plot(m2, type = "acf", lag.max = 30)
##D 
##D ## ------ (use simul2) ------
##D # complex model (with a long (!) runtime)
##D 
##D # load simulated data set 'simul2'
##D data(simul2)
##D y <- simul2$y
##D E <- simul2$E
##D cID <- simul2$cID
##D X <- as.matrix(simul2[, -c(1:3,9,10)])
##D validation <- simul2[, c("v", "m"), drop = FALSE]
##D  
##D # function call (with random intercept in both sub-models)
##D model <- list(riBeta = 1, riAlpha = 1, clBetaID = cID, clAlphaID = cID)
##D m3 <- pogitBvs(y = y, E = E, X = X, validation = validation, model = model, 
##D                mcmc = list(M = 6000, burnin = 200, thin = 10), BVS = TRUE)
##D print(m3)
##D summary(m3)
##D plot(m3)
##D 
##D ## ------ (use cervical cancer data) ------
##D # load cervical cancer data
##D data(cervical)
##D data(cervical_validation)
##D y <- cervical$y
##D E <- cervical$E
##D X <- as.matrix(cervical[, -c(1:4)])
##D validation <- cervical_validation[, c(1, 2), drop = FALSE]
##D W          <- as.matrix(cervical_validation[, -c(1:3)])
##D subcat     <- factor(as.numeric(cervical$country))
##D 
##D # function call 
##D m4 <- pogitBvs(y = y, E = E, X = X, W = W, validation = validation, 
##D                model = list(subcat = subcat), mcmc = list(M = 10000, 
##D                burnin = 2000, thin = 10), start = list(firth = TRUE), 
##D                BVS = TRUE)             
##D print(m4)
##D # additionally compute estimated risks and reporting probabilities
##D summary(m4, printRes = TRUE) 
##D plot(m4, burnin = FALSE, thin = FALSE)
##D plot(m4, type = "acf", lag.max = 50)
##D 
##D # informative prior instead of validation data (change prior settings)
##D # e.g. prior information on country-specific reporting probabilities 
##D p.a0 <- 0.85
##D p.a  <- c(0.99, 0.70, 0.85)
##D m0a_inf <- log(p.a0/(1 - p.a0))  # prior information for alpha_0
##D aj0_inf <- log(p.a/(1 - p.a))    # prior information for alpha
##D 
##D prior.set <- list(m0a = m0a_inf, aj0 = aj0_inf, VL = 0.005, slabL = "Normal")
##D m5 <- pogitBvs(y = y, X = X, W = W, E = E, method = "infprior", 
##D                model = list(subcat = subcat), prior = prior.set, 
##D                mcmc = list(M = 10000, burnin = 2000, thin = 10))
##D print(m5)
##D summary(m5, printRes = TRUE)
##D plot(m5, burnin = FALSE, thin = FALSE)
##D plot(m5, type = "acf", lag.max = 50)
## End(Not run)



