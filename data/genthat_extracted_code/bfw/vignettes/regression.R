## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----simulatedata--------------------------------------------------------
# Create normal distributed data with mean = 0 and standard deviation = 1
## r = 0.5
data <- MASS::mvrnorm(n=100,
                      mu=c(0, 0),
                      Sigma=matrix(c(1, 0.5, 0.5, 1), 2),
                      empirical=TRUE)
# Add names
colnames(data) <- c("x","y")

## ----freq1---------------------------------------------------------------
# Correlation
stats::cor(data)[2]

# Regression
summary(stats::lm(y ~ x, data=data.frame(data)))

## ----baeys1, eval = FALSE------------------------------------------------
#  mcmc <- bfw::bfw(project.data = data,
#              y = "y",
#              x = "x",
#              saved.steps = 50000,
#              jags.model = "regression",
#              jags.seed = 100,
#              silent = TRUE)
#  # Print the results
#  round(mcmc$summary.MCMC[,3:7],3)
#  #>                        Mode   ESS  HDIlo HDIhi   n
#  #> beta0[1]: Intercept  -0.008 50000 -0.172 0.173 100
#  #> beta[1]: Y vs. X      0.492 51970  0.330 0.674 100
#  #> sigma[1]: Y vs. X     0.863 28840  0.760 1.005 100
#  #> zbeta0[1]: Intercept -0.008 50000 -0.172 0.173 100
#  #> zbeta[1]: Y vs. X     0.492 51970  0.330 0.674 100
#  #> zsigma[1]: Y vs. X    0.863 28840  0.760 1.005 100
#  #> R^2 (block: 1)        0.246 51970  0.165 0.337 100

## ----noise---------------------------------------------------------------
# Create noise with mean = 10 / -10 and sd = 1
## r = -1.0
noise <- MASS::mvrnorm(n=2,
                       mu=c(10, -10),
                       Sigma=matrix(c(1, -1, -1, 1), 2),
                       empirical=TRUE)
# Combine data
biased.data <- rbind(data,noise)

## ----freq2---------------------------------------------------------------
# Correlation
stats::cor(biased.data)[2]

# Regression
summary(stats::lm(y ~ x, data=data.frame(biased.data)))

## ----baeys2, eval = FALSE------------------------------------------------
#  mcmc.robust <- bfw::bfw(project.data = biased.data,
#              y = "y",
#              x = "x",
#              saved.steps = 50000,
#              jags.model = "regression",
#              jags.seed = 100,
#              run.robust = TRUE,
#              silent = TRUE)
#  # Print the results
#  round(mcmc.robust$summary.MCMC[,3:7],3)
#  #>                        Mode   ESS  HDIlo HDIhi   n
#  #> beta0[1]: Intercept  -0.026 29844 -0.204 0.141 102
#  #> beta[1]: Y vs. X      0.430 29549  0.265 0.604 102
#  #> sigma[1]: Y vs. X     0.671 16716  0.530 0.842 102
#  #> zbeta0[1]: Intercept  0.138 28442  0.042 0.244 102
#  #> zbeta[1]: Y vs. X     0.430 29549  0.265 0.604 102
#  #> zsigma[1]: Y vs. X    0.392 16716  0.310 0.492 102
#  #> R^2 (block: 1)        0.236 29549  0.145 0.331 102

