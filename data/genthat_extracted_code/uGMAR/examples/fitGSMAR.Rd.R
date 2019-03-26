library(uGMAR)


### Name: fitGSMAR
### Title: Estimate Gaussian or Student's t Mixture Autoregressive model
### Aliases: fitGSMAR

### ** Examples

## No test: 
# These are long running examples and use parallel computing

# GMAR model
fit12 <- fitGSMAR(VIX, 1, 2, runTests=TRUE)
fit12
summary(fit12)
plot(fit12)

# Restricted GMAR model
fit12r <- fitGSMAR(VIX, 1, 2, restricted=TRUE,
 parametrization="mean", nCalls=10)
fit12r
summary(fit12r)

# Non-mixture version of StMAR model
fit11t <- fitGSMAR(VIX, 1, 1, model="StMAR", nCores=1, nCalls=1)
fit11t

# StMAR model, 100 estimations rounds
fit12t <- fitGSMAR(VIX, 1, 2, model="StMAR", nCalls=100)
fit12t

# Restricted StMAR model (implied by the StMAR(1,2) model)
fit12tr <- fitGSMAR(VIX, 1, 2, model="StMAR", restricted=TRUE)
fit12tr

# G-StMAR model (implied by the StMAR(1,2) models), 100 estimation rounds
fit12gs <- fitGSMAR(VIX, 1, c(1, 1), model="G-StMAR", nCalls=100)
fit12gs

# Restricted G-StMAR model (implied by the previous StMAR and G-StMAR models)
fit12gsr <- fitGSMAR(VIX, 1, c(1, 1), model="G-StMAR", restricted=TRUE)
fit12gsr

# Fit GMAR model that is a mixture of AR(1) and such AR(3) model that the
# second AR coeffiecient is constrained to zero.
constraints <- list(matrix(c(1, 0, 0, 0, 0, 1), ncol=2), as.matrix(c(1, 0, 0)))
fit32c <- fitGSMAR(VIX, 3, 2, constraints=constraints)
fit32c

# Fit such constrained StMAR(3, 1) model that the second order AR coefficient
# is constrained to zero.
constraints <- list(matrix(c(1, 0, 0, 0, 0, 1), ncol=2))
fit31tc <- fitGSMAR(VIX, 3, 1, model="StMAR", constraints=constraints)
fit31tc

# Fit such StMAR(3,2) model that the AR coefficients are restricted to be
# the same for both regimes and that the second AR coefficients are
# constrained to zero.
fit32trc <- fitGSMAR(VIX, 3, 2, model="StMAR", restricted=TRUE,
                     constraints=matrix(c(1, 0, 0, 0, 0, 1), ncol=2))
fit32trc
## End(No test)



