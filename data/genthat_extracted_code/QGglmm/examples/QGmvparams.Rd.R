library(QGglmm)


### Name: QGmvparams
### Title: Quantitative Genetics parameters from GLMM estimates
###   (multivariate analysis).
### Aliases: QGmvparams

### ** Examples

## Example using a bivariate model (Binary trait/Gaussian trait)
# Parameters
mu <- c(0, 1)
G <- diag(c(0.5, 2))
P <- diag(c(1, 4))

# Note: no phenotypic, nor genetic correlations, hence should be equal to univariate case!

# Multivariate analysis
QGmvparams(mu = mu, vcv.G = G, vcv.P = P, models = c("binom1.probit", "Gaussian"))
QGparams(mu = 0, var.a = 0.5, var.p = 1, model = "binom1.probit") # Consistent results!
# Reminder: the results are the same here because we have no correlation between the two traits

# Defining the model "by hand" using the list
list.models = list(
  model1 = list(inv.link = function(x){pnorm(x)},
                d.inv.link = function(x){dnorm(x)},
                var.func = function(x){pnorm(x) * (1 - pnorm(x))}),
  model2 = list(inv.link = function(x){x},
                d.inv.link = function(x){1},
                var.func = function(x){0})
)
# Running the same analysis than above
QGmvparams(mu = mu, vcv.G = G, vcv.P = P, models = list.models) # Same results!

# Using predicted values
# Say we have 100  individuals
n <- 100
# Let's simulate predicted values
p <- matrix(c(runif(n), runif(n)), ncol = 2)
# Note that p has as many as columns as we have traits (i.e. two)
# Multivariate analysis with predicted values
## Not run: QGmvparams(predict = p, vcv.G = G, vcv.P = P, models = c("binom1.probit", "Gaussian"))



