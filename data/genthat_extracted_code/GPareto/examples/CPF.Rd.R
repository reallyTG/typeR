library(GPareto)


### Name: CPF
### Title: Conditional Pareto Front simulations
### Aliases: CPF

### ** Examples

library(DiceDesign)
set.seed(42)

nvar <- 2

fname <- "P1" # Test function

# Initial design
nappr <- 10
design.grid <- maximinESE_LHS(lhsDesign(nappr, nvar, seed = 42)$design)$design
response.grid <- t(apply(design.grid, 1, fname))

# kriging models: matern5_2 covariance structure, linear trend, no nugget effect
mf1 <- km(~., design = design.grid, response = response.grid[,1])
mf2 <- km(~., design = design.grid, response = response.grid[,2])

# Conditional simulations generation with random sampling points 
nsim <- 40
npointssim <- 150 # increase for better results
Simu_f1 <- matrix(0, nrow = nsim, ncol = npointssim)
Simu_f2 <- matrix(0, nrow = nsim, ncol = npointssim)
design.sim <- array(0, dim = c(npointssim, nvar, nsim))

for(i in 1:nsim){
  design.sim[,,i] <- matrix(runif(nvar*npointssim), nrow = npointssim, ncol = nvar)
  Simu_f1[i,] <- simulate(mf1, nsim = 1, newdata = design.sim[,,i], cond = TRUE,
                          checkNames = FALSE, nugget.sim = 10^-8)
  Simu_f2[i,] <- simulate(mf2, nsim = 1, newdata = design.sim[,,i], cond = TRUE, 
                          checkNames = FALSE, nugget.sim = 10^-8)
}

# Attainment and Voreb'ev expectation + deviation estimation
CPF1 <- CPF(Simu_f1, Simu_f2, response.grid)

# Details about the Vorob'ev threshold  and Vorob'ev deviation
summary(CPF1)

# Graphics
plot(CPF1)




