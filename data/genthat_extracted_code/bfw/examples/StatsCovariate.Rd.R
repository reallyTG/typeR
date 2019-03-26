library(bfw)


### Name: StatsCovariate
### Title: Covariate
### Aliases: StatsCovariate

### ** Examples

# Create normal distributed data with mean = 0 and standard deviation = 1
## r = 0.5
data <- MASS::mvrnorm(n=100,
                      mu=c(0, 0),
                      Sigma=matrix(c(1, 0.5, 0.5, 1), 2),
                      empirical=TRUE)
# Add names
colnames(data) <- c("X","Y")
# Create noise with mean = 10 / -10 and sd = 1
## r = -1.0
noise <- MASS::mvrnorm(n=2,
                       mu=c(10, -10),
                       Sigma=matrix(c(1, -1, -1, 1), 2),
                       empirical=TRUE)
# Combine noise and data
biased.data <- rbind(data,noise)


# Run analysis on normal distributed data
## No test: 
mcmc <- bfw(project.data = data,
            y = "X,Y",
            saved.steps = 50000,
            jags.model = "covariate",
            jags.seed = 100,
            silent = TRUE)
## End(No test)
# Run robust analysis on normal distributed data
## No test: 
mcmc.robust <- bfw(project.data = data,
                   y = "X,Y",
                   saved.steps = 50000,
                   jags.model = "covariate",
                   run.robust = TRUE,
                   jags.seed = 101,
                   silent = TRUE)
## End(No test)
# Run analysis on data with outliers
## No test: 
biased.mcmc <- bfw(project.data = biased.data,
                   y = "X,Y",
                   saved.steps = 50000,
                   jags.model = "covariate",
                   jags.seed = 102,
                   silent = TRUE)
## End(No test)
# Run robust analysis on data with outliers
## No test: 
biased.mcmc.robust <- bfw(project.data = biased.data,
                          y = "X,Y",
                          saved.steps = 50000,
                          jags.model = "covariate",
                          run.robust = TRUE,
                          jags.seed = 103,
                          silent = TRUE)
## End(No test)
# Print frequentist results
stats::cor(data)[2]
# [1] 0.5
stats::cor(noise)[2]
# [1] -1
stats::cor(biased.data)[2]
# [1] -0.498

# Print Bayesian results
## No test: 
 mcmc$summary.MCMC 
## End(No test)
#                   Mean Median  Mode   ESS HDIlo HDIhi   n
# cor[1,1]: X vs. X 1.000  1.000 0.999     0 1.000 1.000 100
# cor[2,1]: Y vs. X 0.488  0.491 0.496 19411 0.337 0.633 100
# cor[1,2]: X vs. Y 0.488  0.491 0.496 19411 0.337 0.633 100
# cor[2,2]: Y vs. Y 1.000  1.000 0.999     0 1.000 1.000 100
## No test: 
 mcmc.robust$summary.MCMC 
## End(No test)
#                   Mean Median  Mode   ESS HDIlo HDIhi   n
# cor[1,1]: X vs. X 1.00  1.000 0.999     0 1.000 1.000 100
# cor[2,1]: Y vs. X 0.47  0.474 0.491 18626 0.311 0.626 100
# cor[1,2]: X vs. Y 0.47  0.474 0.491 18626 0.311 0.626 100
# cor[2,2]: Y vs. Y 1.00  1.000 0.999     0 1.000 1.000 100
## No test: 
 biased.mcmc$summary.MCMC 
## End(No test)
#                    Mean Median   Mode   ESS  HDIlo  HDIhi   n
# cor[1,1]: X vs. X  1.000  1.000  0.999     0  1.000  1.000 102
# cor[2,1]: Y vs. X -0.486 -0.489 -0.505 19340 -0.627 -0.335 102
# cor[1,2]: X vs. Y -0.486 -0.489 -0.505 19340 -0.627 -0.335 102
# cor[2,2]: Y vs. Y  1.000  1.000  0.999     0  1.000  1.000 102
## No test: 
 biased.mcmc.robust$summary.MCMC 
## End(No test)
#                   Mean Median  Mode   ESS HDIlo HDIhi   n
# cor[1,1]: X vs. X 1.000  1.000 0.999     0 1.000 1.000 102
# cor[2,1]: Y vs. X 0.338  0.343 0.356 23450 0.125 0.538 102
# cor[1,2]: X vs. Y 0.338  0.343 0.356 23450 0.125 0.538 102
# cor[2,2]: Y vs. Y 1.000  1.000 0.999     0 1.000 1.000 102



