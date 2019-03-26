library(IMIFA)


### Name: mcmc_IMIFA
### Title: Adaptive Gibbs Sampler for Nonparameteric Model-based Clustering
###   using models from the IMIFA family
### Aliases: mcmc_IMIFA print.IMIFA summary.IMIFA
### Keywords: IMIFA main

### ** Examples

# data(olive)
# data(coffee)

# Fit an IMIFA model to the olive data. Accept all defaults.
# simIMIFA <- mcmc_IMIFA(olive, method="IMIFA")
# summary(simIMIFA)

# Fit an IMIFA model assuming a Pitman-Yor prior.
# Control the balance between the DP and PY priors using the kappa parameter.
# simPY    <- mcmc_IMIFA(olive, method="IMIFA", kappa=0.75)
# summary(simPY)

# Fit a MFA model to the scaled olive data, with isotropic uniquenesses (i.e. MPPCA).
# Allow diagonal covariance as a special case where range.Q = 0.
# Don't store the scores. Accept all other defaults.
# simMFA   <- mcmc_IMIFA(olive, method="MFA", n.iters=10000, range.G=3:6, range.Q=0:3,
#                        score.switch=FALSE, centering=FALSE, uni.type="isotropic")

# Fit a MIFA model to the centered & scaled coffee data, w/ cluster labels initialised by K-Means.
# Note that range.Q doesn't need to be specified. Allow IFA as a special case where range.G=1.
# simMIFA  <- mcmc_IMIFA(coffee, method="MIFA", n.iters=10000, range.G=1:3, z.init="kmeans")

# Fit an IFA model to the centered and pareto scaled olive data.
# Note that range.G doesn't need to be specified. We can optionally supply a range.Q starting value.
# Enforce additional shrinkage using alpha.d1, alpha.d2, prop, and eps (via mgpControl()).
# simIFA   <- mcmc_IMIFA(olive, method="IFA", n.iters=10000, range.Q=4, scaling="pareto",
#                        alpha.d1=2.5, alpha.d2=4, prop=0.6, eps=0.12)

# Fit an OMIFA model to the centered & scaled coffee data.
# Supply a sufficiently small alpha value. Try varying other hyperparameters.
# Accept the default value for the starting number of factors,
# but supply a value for the starting number of clusters.
# Try constraining uniquenesses to be common across both variables and clusters.
# simOMIFA <- mcmc_IMIFA(coffee, method="OMIFA", range.G=10, psi.alpha=3,
#                        phi.hyper=c(2, 1), alpha=0.8, uni.type="single")



