library(GMCM)


### Name: fit.meta.GMCM
### Title: Estimate GMCM parameters of the special model
### Aliases: fit.meta.GMCM fit.meta.gmcm

### ** Examples

set.seed(1)

# True parameters
true.par <- c(0.9, 2, 0.7, 0.6)
# Simulation of data from the GMCM model
data <- SimulateGMCMData(n = 1000, par = true.par)
uhat <- Uhat(data$u) # Ranked observed data

init.par <- c(0.5, 1, 0.5, 0.9)  # Initial parameters

# Optimization with Nelder-Mead
nm.par   <- fit.meta.GMCM(uhat, init.par = init.par, method = "NM")

## Not run: 
##D # Comparison with other optimization methods
##D # Optimization with simulated annealing
##D sann.par <- fit.meta.GMCM(uhat, init.par = init.par, method = "SANN",
##D                           max.ite = 3000, temp = 1)
##D # Optimization with the Pseudo EM algorithm
##D pem.par  <- fit.meta.GMCM(uhat, init.par = init.par, method = "PEM")
##D 
##D # The estimates agree nicely
##D rbind("True" = true.par, "Start" = init.par,
##D       "NM" = nm.par, "SANN" = sann.par, "PEM" = pem.par)
## End(Not run)

# Get estimated cluster
Khat <- get.IDR(x = uhat, par = nm.par)$Khat
plot(uhat, col = Khat, main = "Clustering\nIDR < 0.05")



