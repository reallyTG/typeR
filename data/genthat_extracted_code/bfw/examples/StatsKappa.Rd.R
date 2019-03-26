library(bfw)


### Name: StatsKappa
### Title: Cohen's Kappa
### Aliases: StatsKappa

### ** Examples

# Simulate rater data
Rater1 <- c(rep(0,20),rep(1,80))
set.seed(100)
Rater2 <- c(rbinom(20,1,0.1), rbinom(80,1,0.9))
data <- data.frame(Rater1,Rater2)

## No test: 
mcmc <- bfw(project.data = data,
            x = "Rater1,Rater2",
            saved.steps = 50000,
            jags.model = "kappa",
            jags.seed = 100,
            silent = TRUE)

## End(No test)
# Print frequentist and Bayesian kappa
library(psych)
psych::cohen.kappa(data)$confid[1,]
#  lower     estimate  upper
#  0.6137906 0.7593583 0.9049260
#' \donttest{ mcmc$summary.MCMC }
#             Mean     Median    Mode      ESS   HDIlo    HDIhi    n
#  Kappa[1]:  0.739176 0.7472905 0.7634503 50657 0.578132 0.886647 100



