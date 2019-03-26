library(enrichwith)


### Name: enrich.glm
### Title: Enrich objects of class 'glm'
### Aliases: enrich.glm

### ** Examples


## Not run: 
##D # A Gamma example, from McCullagh & Nelder (1989, pp. 300-2)
##D clotting <- data.frame(
##D    u = c(5,10,15,20,30,40,60,80,100, 5,10,15,20,30,40,60,80,100),
##D    time = c(118,58,42,35,27,25,21,19,18,69,35,26,21,18,16,13,12,12),
##D    lot = factor(c(rep(1, 9), rep(2, 9))))
##D cML <- glm(time ~ lot*log(u), data = clotting, family = Gamma)
##D 
##D # The simulate method for the above fit would simulate at coef(cML)
##D # for the regression parameters and MASS::gamma.dispersion(cML) for
##D # the dispersion. It is not possible to simulate at different
##D # parameter values than those, at least not, without "hacking" the
##D # cML object.
##D 
##D # A general simulator for cML results via its enrichment with
##D # auxiliary functions:
##D cML_functions <- get_auxiliary_functions(cML)
##D # which is a shorthand for
##D # enriched_cML <- enrich(cML, with = "auxiliary functions")
##D # cML_functions <- enriched_cML$auxiliary_functions
##D 
##D # To simulate 2 samples at the maximum likelihood estimator do
##D dispersion_mle <- MASS::gamma.dispersion(cML)
##D cML_functions$simulate(coef = coef(cML),
##D                        dispersion = dispersion_mle,
##D                        nsim = 2, seed = 123)
##D # To simulate 5 samples at c(0.1, 0.1, 0, 0) and dispersion 0.2 do
##D cML_functions$simulate(coef = c(0.1, 0.1, 0, 0),
##D                        dispersion = 0.2,
##D                        nsim = 5, seed = 123)
##D 
## End(Not run)

## Not run: 
##D 
##D ## Reproduce left plot in Figure 4.1 in Kosimdis (2007)
##D ## (see http://www.ucl.ac.uk/~ucakiko/files/ikosmidis_thesis.pdf)
##D mod <- glm(1 ~ 1, weights = 10, family = binomial())
##D enriched_mod <- enrich(mod, with = "auxiliary functions")
##D biasfun <- enriched_mod$auxiliary_functions$bias
##D probabilities <- seq(1e-02, 1 - 1e-02, length = 100)
##D biases <- Vectorize(biasfun)(qlogis(probabilities))
##D plot(probabilities, biases, type = "l", ylim = c(-0.5, 0.5),
##D      xlab = expression(pi), ylab = "first-order bias")
##D abline(h = 0, lty = 2); abline(v = 0.5, lty = 2)
##D title("First-order bias of the MLE of the log-odds", sub = "m = 10")
## End(Not run)



