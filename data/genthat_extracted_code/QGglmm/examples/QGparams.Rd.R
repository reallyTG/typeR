library(QGglmm)


### Name: QGparams
### Title: Quantitative Genetics parameters from GLMM estimates.
### Aliases: QGparams

### ** Examples

## Example using binary data
# Parameters
mu <- 0
va <- 1
vp <- 2

# Simulating data l = mu + a + e
lat<- mu + rnorm(1000, 0, sqrt(va)) + rnorm(1000, 0, sqrt(vp - va))
y<- rbinom(1000, 1, pnorm(lat))

# Expected results
QGparams(mu = 0, var.p = 2, var.a = 1, model = "binom1.probit")
# Simulated results for mean and variance
mean(y)
var(y)

# Using integral approximations
QGparams(mu = 0, var.p = 2, var.a = 1, model = "binom1.probit", closed.form = FALSE)
# Note that the approximation is exactly equal to the results obtained with the closed form

# Let's create a custom model
custom <- list(inv.link = function(x){pnorm(x)},
    var.func = function(x){pnorm(x) * (1 - pnorm(x))},
    d.inv.link = function(x){dnorm(x)})
    
QGparams(mu = 0, var.p = 2, var.a = 1, custom.model = custom)

# Using an ordinal model (with 4 categories)
QGparams(mu = 0.1, var.a = 1, var.p = 2, cut.points = c( - Inf, 0, 0.5, 1, Inf), model = "ordinal")
# Note the slightly different output (see QGmvparams)

# Integrating over a posterior distribution
# e.g. output from MCMCglmm named "model"
# df <- data.frame(mu = model$Sol[, 'intercept'], 
#                  va = model$VCV[, 'animal'], 
#                  vp = rowSums(model$VCV))
# params <- apply(df, 1, function(row){
#        QGparams(mu = row$mu, var.a = row$va, var.p = row$vp, model = "Poisson.log")
# })



