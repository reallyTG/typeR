library(epiphy)


### Name: fit_two_distr
### Title: Maximum likelihood fitting of two distributions and
###   goodness-of-fit comparison.
### Aliases: fit_two_distr fit_two_distr.default fit_two_distr.count
###   fit_two_distr.incidence

### ** Examples

# Simple workflow for incidence data:
my_data <- count(arthropods)
my_data <- split(my_data, by = "t")[[3]]
my_res  <- fit_two_distr(my_data)
summary(my_res)
plot(my_res)

# Simple workflow for incidence data:
my_data <- incidence(tobacco_viruses)
my_res  <- fit_two_distr(my_data)
summary(my_res)
plot(my_res)

# Note that there are other methods to fit some common distributions.
# For example for the Poisson distribution, one can use glm:
my_arthropods <- arthropods[arthropods$t == 3, ]
my_model <- glm(my_arthropods$i ~ 1, family = poisson)
lambda <- exp(coef(my_model)[[1]]) # unique(my_model$fitted.values) works also.
lambda
# ... or the fitdistr function in MASS package:
require(MASS)
fitdistr(my_arthropods$i, "poisson")

# For the binomial distribution, glm still works:
my_model <- with(tobacco_viruses, glm(i/n ~ 1, family = binomial, weights = n))
prob <- logit(coef(my_model)[[1]], rev = TRUE)
prob
# ... but the binomial distribution is not yet recognized by MASS::fitdistr.

# Examples featured in Madden et al. (2007).
# p. 242-243
my_data <- incidence(dogwood_anthracnose)
my_data <- split(my_data, by = "t")
my_fit_two_distr <- lapply(my_data, fit_two_distr)
lapply(my_fit_two_distr, function(x) x$param$aggregated[c("prob", "theta"), ])
lapply(my_fit_two_distr, plot)

my_agg_index <- lapply(my_data, agg_index)
lapply(my_agg_index, function(x) x$index)
lapply(my_agg_index, chisq.test)




