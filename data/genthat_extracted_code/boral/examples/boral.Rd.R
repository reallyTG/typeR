library(boral)


### Name: boral
### Title: Fitting boral (Bayesian Ordination and Regression AnaLysis)
###   models
### Aliases: boral boral.default print.boral

### ** Examples

library(mvabund) ## Load a dataset from the mvabund package
data(spider)
y <- spider$abun
X <- scale(spider$x)
n <- nrow(y)
p <- ncol(y)

## NOTE: The values below MUST NOT be used in a real application;
## they are only used here to make the examples run quick!!!
example_mcmc_control <- list(n.burnin = 10, n.iteration = 100, 
     n.thin = 1)

     
## Example 1 - model with two latent variables, site effects, 
## 	and no environmental covariates
spiderfit_nb <- boral(y, family = "negative.binomial", 
    lv.control = list(num.lv = 2), row.eff = "fixed", 
    mcmc.control = example_mcmc_control)

summary(spiderfit_nb)

par(mfrow = c(2,2))
plot(spiderfit_nb) ## Plots used in residual analysis, 
## Used to check if assumptions such an mean-variance relationship 
## are adequately satisfied.

lvsplot(spiderfit_nb) ## Biplot of the latent variables, 
## which can be interpreted in the same manner as an ordination plot.

## Not run: 
##D ## Example 2a - model with no latent variables, no site effects, 
##D ##      and environmental covariates
##D spiderfit_nb <- boral(y, X = X, family = "negative.binomial", 
##D     mcmc.control = example_mcmc_control)
##D 
##D summary(spiderfit_nb) 
##D ## The results can be compared with the default example from 
##D ## the manyglm() function in mvabund. 
##D 
##D ## Caterpillar plots for the coefficients
##D par(mfrow=c(2,3), mar = c(5,6,1,1))
##D sapply(colnames(spiderfit_nb$X), coefsplot, x = spiderfit_nb)
##D 
##D 
##D ## Example 2b - suppose now, for some reason, the 28 rows were
##D ## 	sampled such into four replications of seven sites
##D ## Let us account for this as a fixed effect
##D spiderfit_nb <- boral(y, X = X, family = "negative.binomial", 
##D     row.eff = "fixed", row.ids = matrix(rep(1:7,each=4),ncol=1),
##D     mcmc.control = example_mcmc_control)
##D 
##D spiderfit_nb$row.coefs
##D 
##D ## Example 2c - suppose now, for some reason, the 28 rows reflected
##D ## 	a nested design with seven regions, each with four sub-regions
##D ## We can account for this nesting as a random effect
##D spiderfit_nb <- boral(y, X = X, family = "negative.binomial", 
##D     row.eff = "random", 
##D     row.ids = cbind(1:n, rep(1:7,each=4)), 
##D     mcmc.control = example_mcmc_control)
##D 
##D spiderfit_nb$row.coefs
##D 
##D ## Example 2d - model with environmental covariates and 
##D ##  two structured latent variables using fake distance matrix
##D fakedistmat <- as.matrix(dist(1:n))
##D spiderfit_lvstruc <- boral(y, X = X, family = "negative.binomial", 
##D     lv.control = list(num.lv = 2, type = "exponential", distmat = fakedistmat))
##D 
##D summary(spiderfit_lvstruc)
##D 
##D ## Example 3a - Extend example 2 to demonstrate grouped covariate selection
##D ## on the last three covariates. 
##D example_prior_control <- list(type = c("normal","normal","normal","uniform"), 
##D      ssvs.index = c(-1,-1,-1,1,2,3))
##D spiderfit_nb2 <- boral(y, X = X, family = "negative.binomial", 
##D     mcmc.control = example_mcmc_control,
##D     prior.control = example_prior_control)
##D      
##D summary(spiderfit_nb2) 
##D 
##D 
##D ## Example 3b - Extend example 2 to demonstrate individual covariate selection
##D ## on the last three covariates. 
##D example_prior_control <- list(type = c("normal","normal","normal","uniform"), 
##D     ssvs.index = c(-1,-1,-1,0,0,0))
##D spiderfit_nb3 <- boral(y, X = X, family = "negative.binomial", 
##D     mcmc.control = example_mcmc_control,
##D     prior.control = example_prior_control)
##D summary(spiderfit_nb3) 
##D 
##D 	
##D ## Example 4 - model fitted to presence-absence data, no site effects, and
##D ## two latent variables
##D data(tikus)
##D y <- tikus$abun
##D y[y > 0] <- 1
##D y <- y[1:20,] ## Consider only years 1981 and 1983
##D y <- y[,apply(y > 0,2,sum) > 2] ## Consider only spp with more than 2 presences
##D      
##D tikus.fit <- boral(y, family = "binomial", 
##D     lv.control = list(num.lv = 2), 
##D     mcmc.control = example_mcmc_control)
##D      
##D lvsplot(tikus.fit, biplot = FALSE) 
##D ## A strong location between the two sampling years 
##D 
##D 
##D ## Example 5a - model fitted to count data, no site effects, and
##D ## two latent variables, plus traits included to explain environmental responses
##D data(antTraits)
##D y <- antTraits$abun
##D X <- as.matrix(scale(antTraits$env))
##D ## Include only traits 1, 2, and 5
##D traits <- as.matrix(antTraits$traits[,c(1,2,5)])
##D example_which_traits <- vector("list",ncol(X)+1)
##D for(i in 1:length(example_which_traits)) 
##D     example_which_traits[[i]] <- 1:ncol(traits)
##D ## Just for fun, the regression coefficients for the second column of X,
##D ## corresponding to the third element in the list example_which_traits,
##D ## will be estimated separately and not regressed against traits.
##D example_which_traits[[3]] <- 0
##D 
##D fit_traits <- boral(y, X = X, traits = traits, 
##D     lv.control = list(num.lv = 2),
##D     which.traits = example_which_traits, family = "negative.binomial",
##D     mcmc.control = example_mcmc_control, save.model = TRUE)
##D 
##D summary(fit_traits)
##D 
##D 
##D ## Example 5b - perform selection on trait coefficients
##D ssvs_traitsindex <- vector("list",ncol(X)+1)
##D for(i in 1:length(ssvs_traitsindex)) 
##D      ssvs_traitsindex[[i]] <- rep(0,ncol(traits))
##D ssvs_traitsindex[[3]] <- -1
##D fit_traits <- boral(y, X = X, traits = traits, which.traits = example_which_traits, 
##D     family = "negative.binomial", 
##D     lv.control = list(num.lv = 2), mcmc.control = example_mcmc_control, 
##D     save.model = TRUE, prior.control = list(ssvs.traitsindex = ssvs_traitsindex))
##D 
##D summary(fit_traits)
##D 
##D 
##D ## Example 6 - simulate Bernoulli data, based on a model with two latent variables, 
##D ## no site variables, with two traits and one environmental covariates 
##D ## This example is a proof of concept that traits can used to 
##D ## explain environmental responses 
##D library(mvtnorm)
##D 
##D n <- 100; s <- 50
##D X <- as.matrix(scale(1:n))
##D colnames(X) <- c("elevation")
##D 
##D traits <- cbind(rbinom(s,1,0.5), rnorm(s)) 
##D ## one categorical and one continuous variable
##D colnames(traits) <- c("thorns-dummy","SLA")
##D 
##D simfit <- list(true.lv = rmvnorm(n, mean = rep(0,2)), 
##D     lv.coefs = cbind(rnorm(s), rmvnorm(s, mean = rep(0,2))), 
##D     traits.coefs = matrix(c(0.1,1,-0.5,1,0.5,0,-1,1), 2, byrow = TRUE))
##D rownames(simfit$traits.coefs) <- c("beta0","elevation")
##D colnames(simfit$traits.coefs) <- c("kappa0","thorns-dummy","SLA","sigma")
##D 
##D simy = create.life(true.lv = simfit$true.lv, lv.coefs = simfit$lv.coefs, X = X, 
##D     traits = traits, traits.coefs = simfit$traits.coefs, family = "binomial") 
##D 
##D 
##D example_which_traits <- vector("list",ncol(X)+1)
##D for(i in 1:length(example_which_traits)) 
##D     example_which_traits[[i]] <- 1:ncol(traits)
##D fit_traits <- boral(y = simy, X = X, traits = traits, 
##D     which.traits = example_which_traits, family = "binomial", 
##D     lv.control = list(num.lv = 2), save.model = TRUE, 
##D     mcmc.control = example_mcmc_control)
##D 
## End(Not run)




