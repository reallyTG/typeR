library(QGglmm)


### Name: QGicc
### Title: Intra - Class Correlation coefficients (ICC) on the observed
###   data scale
### Aliases: QGicc

### ** Examples

## Example using Poisson count data
# Parameters
mu <- 0
va <- 0.5
vm <- 0.2  # Maternal effect
vp <- 1

# Simulating data l = mu + a + e
lat <- mu + 
       rnorm(1000, 0, sqrt(va)) + 
       rnorm(1000, 0, sqrt(vm)) +
       rnorm(1000, 0, sqrt(vp - (va + vm)))
y   <- rpois(1000, exp(lat))

# Computing the broad - sense heritability
QGicc(mu = mu, var.p = vp, var.comp = va, model = "Poisson.log")
# Computing the maternal effect ICC
QGicc(mu = mu, var.p = vp, var.comp = vm, model = "Poisson.log")

# Using integral computation
QGicc(mu = mu, var.p = vp, var.comp = vm, model = "Poisson.log", closed.form = FALSE)
# Note that the "approximation" is exactly equal to the results obtained with the closed form

# Let's create a custom model
custom <- list(inv.link = function(x){exp(x)},
    var.func = function(x){exp(x)},
    d.inv.link = function(x){exp(x)})
    
QGicc(mu = mu, var.p = vp, var.comp = vm, custom.model = custom)
# Again, exactly equal

# Integrating over a posterior distribution
# e.g. output from MCMCglmm named "model"
# df <- data.frame(mu = model$Sol[, 'intercept'], 
#                  vm = model$VCV[, 'mother'], 
#                  vp = rowSums(model$VCV))
# params <- apply(df, 1, function(row){
#        QGicc(mu = row$mu, var.comp = row$vm, var.p = row$vp, model = "Poisson.log")
# })



