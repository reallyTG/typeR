library(CIEE)


### Name: score_and_hessian_matrix_functions
### Title: Score and hessian matrix based on the estimating functions.
### Aliases: score_and_hessian_matrix_functions deriv_obj scores hessian

### ** Examples


# Generate data including Y, K, L, X under the GLM setting
dat <- generate_data(setting = "GLM")

# Obtain estimating functions' expressions
estfunct <- est_funct_expr(setting = "GLM")

# Obtain point estimates of the parameters
estimates <- get_estimates(setting = "GLM", Y = dat$Y, X = dat$X,
                           K = dat$K, L = dat$L)

# Obtain matrices with all first and second derivatives
derivobj <- deriv_obj(setting = "GLM", logL1 = estfunct$logL1,
                      logL2 = estfunct$logL2, Y = dat$Y, X = dat$X,
                      K = dat$K, L = dat$L, estimates = estimates)
names(derivobj)
head(derivobj$logL1_deriv$gradient)

# Obtain score and hessian matrices
scores(derivobj)
hessian(derivobj)




