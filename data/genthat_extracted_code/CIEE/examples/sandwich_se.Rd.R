library(CIEE)


### Name: sandwich_se
### Title: Sandwich standard error estimates
### Aliases: sandwich_se

### ** Examples


# Generate data including Y, K, L, X under the GLM setting
dat <- generate_data(setting = "GLM")

# Obtain estimating functions expressions
estfunct <- est_funct_expr(setting = "GLM")

# Obtain point estimates of the parameters
estimates <- get_estimates(setting = "GLM", Y = dat$Y, X = dat$X,
                           K = dat$K, L = dat$L)

# Obtain matrices with all first and second derivatives
derivobj <- deriv_obj(setting = "GLM", logL1 = estfunct$logL1,
                      logL2 = estfunct$logL2, Y = dat$Y, X = dat$X,
                      K = dat$K, L = dat$L, estimates = estimates)

# Obtain score and hessian matrices
results_scores <- scores(derivobj)
results_hessian <- hessian(derivobj)

# Obtain sandwich standard error estimates of the parameters
sandwich_se(scores = results_scores, hessian = results_hessian)




