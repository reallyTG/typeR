library(QGglmm)


### Name: QGmvicc
### Title: Intra - Class Correlation coefficients (ICC) on the observed
###   data scale (multivariate analysis).
### Aliases: QGmvicc

### ** Examples

## Example using a bivariate model (Binary trait/Gaussian trait)
# Parameters
mu <- c(0, 1)
G <- diag(c(0.5, 2))
M <- diag(c(0.2, 1))  # Maternal effect VCV matrix
P <- diag(c(1, 4))

# Broad - sense "G-matrix" on observed data scale
## Not run: QGmvicc(mu = mu, vcv.comp = G, vcv.P = P, models = c("binom1.probit", "Gaussian"))
# Maternal effect VCV matrix on observed data scale
## Not run: QGmvicc(mu = mu, vcv.comp = M, vcv.P = P, models = c("binom1.probit", "Gaussian"))
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
QGmvicc(mu = mu, vcv.comp = M, vcv.P = P, models = list.models)

# Using predicted values
# Say we have 100  individuals
n <- 100
# Let's simulate predicted values
p <- matrix(c(runif(n), runif(n)), ncol = 2)
# Note that p has as many as columns as we have traits (i.e. two)
# Multivariate analysis with predicted values
## Not run: QGmvicc(predict = p, vcv.comp = M, vcv.P = P, models = c("binom1.probit", "Gaussian"))
# That can be a bit long to run!



