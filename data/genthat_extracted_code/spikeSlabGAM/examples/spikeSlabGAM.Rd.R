library(spikeSlabGAM)


### Name: spikeSlabGAM
### Title: Generate posterior samples for a GAMM with spike-and-slab priors
### Aliases: spikeSlabGAM

### ** Examples

## Not run: 
##D ## examples not run due to time constraints on CRAN checks.
##D ## full examples below should take about 2-4 minutes.
##D 
##D set.seed(91179)
##D n <- 400
##D d <- data.frame(f1 = sample(gl(3, n/3)), f2 = sample(gl(4,
##D 						n/4)), x1 = runif(n), x2 = runif(n), x3 = runif(n))
##D # true model:
##D #   - interaction between f1 and x1
##D #   - smooth interaction between x1 and x2,
##D #   - x3 and f2 are noise variables without influence on y
##D nf1 <- as.numeric(d$f1)
##D d$f <- with(d, 5 * (nf1 + 2 * sin(4 * pi * (x1 - 0.2) *
##D 									(x2 - 0.7)) - nf1 * x1))
##D d$y <- with(d, scale(f + rnorm(n)))
##D d$yp <- with(d, rpois(n, exp(f/10)))
##D 
##D # fit & display the model:
##D m1 <- spikeSlabGAM(y ~ x1 * f1 + f1 * f2 + x3 * f1 +
##D 				x1 * x2, data = d)
##D summary(m1)
##D 
##D # visualize estimates:
##D plot(m1)
##D plot(m1, cumulative = FALSE)
##D (plotTerm("fct(f1):fct(f2)", m1, aggregate = median))
##D print(p <- plotTerm("sm(x1):sm(x2)", m1, quantiles = c(0.25,
##D 						0.75), cumulative = FALSE))
##D 
##D # change MCMC settings and priors:
##D mcmc <- list(nChains = 3, burnin = 100, chainLength = 1000,
##D 		thin = 3, reduceRet = TRUE)
##D hyper <- list(gamma = c(v0 = 5e-04), tau2 = c(10,
##D 				30), w = c(2, 1))
##D 
##D # complicated formula example, poisson response:
##D m2 <- spikeSlabGAM(yp ~ x1 * (x2 + f1) + (x2 + x3 + f2)^2 -
##D          sm(x2):sm(x3), data = d,
##D   				family = "poisson", mcmc = mcmc,
##D 		      hyperparameters = hyper)
##D summary(m2)
##D plot(m2)
##D 
##D # quick&dirty convergence diagnostics:
##D print(b <- ssGAM2Bugs(m2))
##D plot(b)
## End(Not run)



