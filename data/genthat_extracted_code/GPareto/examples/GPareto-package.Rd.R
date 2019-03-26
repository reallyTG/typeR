library(GPareto)


### Name: GPareto-package
### Title: Package GPareto
### Aliases: GPareto-package GPareto

### ** Examples

## Not run: 
##D #------------------------------------------------------------
##D # Example 1 : Surrogate-based multi-objective Optimization with postprocessing
##D #------------------------------------------------------------
##D set.seed(25468)
##D 
##D d <- 2 
##D fname <- P2
##D 
##D plotParetoGrid(P2) # For comparison
##D 
##D # Optimization
##D budget <- 25 
##D lower <- rep(0, d) 
##D upper <- rep(1, d)
##D      
##D omEGO <- easyGParetoptim(fn = fname, budget = budget, lower = lower, upper = upper)
##D 
##D # Postprocessing
##D plotGPareto(omEGO, add= FALSE, UQ_PF = TRUE, UQ_PS = TRUE, UQ_dens = TRUE)
##D 
## End(Not run)
#------------------------------------------------------------
# Example 2 : Surrogate-based multi-objective Optimization including a cheap function
#------------------------------------------------------------
set.seed(42)
library(DiceDesign)

d <- 2 

fname <- P1
n.grid <- 19
test.grid <- expand.grid(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid))
nappr <- 15 
design.grid <- maximinESE_LHS(lhsDesign(nappr, d, seed = 42)$design)$design
response.grid <- t(apply(design.grid, 1, fname))

mf1 <- km(~., design = design.grid, response = response.grid[,1])
mf2 <- km(~., design = design.grid, response = response.grid[,2])
model <- list(mf1, mf2)

nsteps <- 1 
lower <- rep(0, d)
upper <- rep(1, d)

# Optimization with fastfun: hypervolume with discrete search

optimcontrol <- list(method = "discrete", candidate.points = test.grid)
omEGO2 <- GParetoptim(model = model, fn = fname, cheapfn = branin, crit = "SMS",
                      nsteps = nsteps, lower = lower, upper = upper,
                      optimcontrol = optimcontrol)
print(omEGO2$par)
print(omEGO2$values)

## Not run: 
##D  
##D plotGPareto(omEGO2)
##D 
##D #------------------------------------------------------------
##D # Example 3 : Surrogate-based multi-objective Optimization (4 objectives)
##D #------------------------------------------------------------
##D set.seed(42)
##D library(DiceDesign)
##D 
##D d <- 5 
##D 
##D fname <- DTLZ3
##D nappr <- 25
##D design.grid <- maximinESE_LHS(lhsDesign(nappr, d, seed = 42)$design)$design
##D response.grid <- t(apply(design.grid, 1, fname, nobj = 4))
##D mf1 <- km(~., design = design.grid, response = response.grid[,1])
##D mf2 <- km(~., design = design.grid, response = response.grid[,2])
##D mf3 <- km(~., design = design.grid, response = response.grid[,3])
##D mf4 <- km(~., design = design.grid, response = response.grid[,4])
##D 
##D # Optimization
##D nsteps <- 5 
##D lower <- rep(0, d) 
##D upper <- rep(1, d)     
##D omEGO3 <- GParetoptim(model = list(mf1, mf2, mf3, mf4), fn = fname, crit = "EMI",
##D                       nsteps = nsteps, lower = lower, upper = upper, nobj = 4)
##D print(omEGO3$par)
##D print(omEGO3$values)
##D plotGPareto(omEGO3)
##D 
##D #------------------------------------------------------------
##D # Example 4 : quantification of uncertainty on Pareto front
##D #------------------------------------------------------------
##D library(DiceDesign)
##D set.seed(42)
##D 
##D nvar <- 2
##D 
##D # Test function P1
##D fname <- "P1"
##D 
##D # Initial design
##D nappr <- 10
##D design.grid <- maximinESE_LHS(lhsDesign(nappr, nvar, seed = 42)$design)$design
##D response.grid <- t(apply(design.grid, 1, fname))
##D 
##D PF <- t(nondominated_points(t(response.grid)))
##D 
##D # kriging models : matern5_2 covariance structure, linear trend, no nugget effect
##D mf1 <- km(~., design = design.grid, response = response.grid[,1])
##D mf2 <- km(~., design = design.grid, response = response.grid[,2])
##D 
##D # Conditional simulations generation with random sampling points 
##D nsim <- 100 # increase for better results
##D npointssim <- 1000 # increase for better results
##D Simu_f1 <- matrix(0, nrow = nsim, ncol = npointssim)
##D Simu_f2 <- matrix(0, nrow = nsim, ncol = npointssim)
##D design.sim <- array(0, dim = c(npointssim, nvar, nsim))
##D 
##D for(i in 1:nsim){
##D   design.sim[,,i] <- matrix(runif(nvar*npointssim), nrow = npointssim, ncol = nvar)
##D   Simu_f1[i,] <- simulate(mf1, nsim = 1, newdata = design.sim[,,i], cond = TRUE,
##D                          checkNames = FALSE, nugget.sim = 10^-8)
##D   Simu_f2[i,] <- simulate(mf2, nsim = 1, newdata = design.sim[,,i], cond = TRUE,
##D                          checkNames = FALSE, nugget.sim = 10^-8)
##D }
##D 
##D # Computation of the attainment function and Vorob'ev Expectation
##D CPF1 <- CPF(Simu_f1, Simu_f2, response.grid, paretoFront = PF)
##D 
##D summary(CPF1)
##D 
##D plot(CPF1)
##D 
##D # Display of the symmetric deviation function
##D plotSymDevFun(CPF1)
## End(Not run)



