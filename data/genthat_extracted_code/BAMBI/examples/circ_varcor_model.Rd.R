library(BAMBI)


### Name: circ_varcor_model
### Title: Analytic circular variances and correlations for bivariate
###   angular models
### Aliases: circ_varcor_model

### ** Examples

circ_varcor_model("vmsin", kappa1= 1, kappa2 = 2, kappa3 = 3)

# Monte Carlo approximation
set.seed(1)
dat <- rvmsin(1000, 1, 2, 3)
# sample circular variance
circ_var <- function(x)
  1 - mean(cos(x - atan2(mean(sin(x)), mean(cos(x))) ))
circ_var(dat[, 1])
circ_var(dat[, 2])
circ_cor(dat, "fl")
circ_cor(dat, "js")




