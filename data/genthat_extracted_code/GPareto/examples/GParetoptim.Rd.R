library(GPareto)


### Name: GParetoptim
### Title: Sequential multi-objective Expected Improvement maximization and
###   model re-estimation, with a number of iterations fixed in advance by
###   the user
### Aliases: GParetoptim

### ** Examples

set.seed(25468)
library(DiceDesign)

################################################
# NOISELESS PROBLEMS
################################################
d <- 2 
fname <- ZDT3
n.grid <- 21
test.grid <- expand.grid(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid))
nappr <- 15 
design.grid <- maximinESE_LHS(lhsDesign(nappr, d, seed = 42)$design)$design
response.grid <- t(apply(design.grid, 1, fname))
Front_Pareto <- t(nondominated_points(t(response.grid)))

mf1 <- km(~1, design = design.grid, response = response.grid[, 1], lower=c(.1,.1))
mf2 <- km(~., design = design.grid, response = response.grid[, 2], lower=c(.1,.1))
model <- list(mf1, mf2)

nsteps <- 2
lower <- rep(0, d)
upper <- rep(1, d)

# Optimization 1: EHI with pso
optimcontrol <- list(method = "pso", maxit = 20)
critcontrol <- list(refPoint = c(1, 10))
omEGO1 <- GParetoptim(model = model, fn = fname, crit = "EHI", nsteps = nsteps,
                     lower = lower, upper = upper, critcontrol = critcontrol,
                     optimcontrol = optimcontrol)
print(omEGO1$par)
print(omEGO1$values)

## Not run: 
##D nsteps <- 10
##D # Optimization 2: SMS with discrete search
##D optimcontrol <- list(method = "discrete", candidate.points = test.grid)
##D critcontrol <- list(refPoint = c(1, 10))
##D omEGO2 <- GParetoptim(model = model, fn = fname, crit = "SMS", nsteps = nsteps,
##D                      lower = lower, upper = upper, critcontrol = critcontrol,
##D                      optimcontrol = optimcontrol)
##D print(omEGO2$par)
##D print(omEGO2$values)
##D 
##D # Optimization 3: SUR with genoud
##D optimcontrol <- list(method = "genoud", pop.size = 20, max.generations = 10)
##D critcontrol <- list(distrib = "SUR", n.points = 100)
##D omEGO3 <- GParetoptim(model = model, fn = fname, crit = "SUR", nsteps = nsteps,
##D                      lower = lower, upper = upper, critcontrol = critcontrol,
##D                      optimcontrol = optimcontrol)
##D print(omEGO3$par)
##D print(omEGO3$values)
##D 
##D # Optimization 4: EMI with pso
##D optimcontrol <- list(method = "pso", maxit = 20)
##D critcontrol <- list(nbsamp = 200)
##D omEGO4 <- GParetoptim(model = model, fn = fname, crit = "EMI", nsteps = nsteps,
##D                      lower = lower, upper = upper, optimcontrol = optimcontrol)
##D print(omEGO4$par)
##D print(omEGO4$values)
##D 
##D # graphics
##D sol.grid <- apply(expand.grid(seq(0, 1, length.out = 100),
##D                               seq(0, 1, length.out = 100)), 1, fname)
##D plot(t(sol.grid), pch = 20, col = rgb(0, 0, 0, 0.05), xlim = c(0, 1),
##D      ylim = c(-2, 10), xlab = expression(f[1]), ylab = expression(f[2]))
##D plotGPareto(res = omEGO1, add = TRUE,
##D             control = list(pch = 20, col = "blue", PF.pch = 17,
##D                            PF.points.col = "blue", PF.line.col = "blue"))
##D text(omEGO1$values[,1], omEGO1$values[,2], labels = 1:nsteps, pos = 3, col = "blue")
##D plotGPareto(res = omEGO2, add = TRUE,
##D             control = list(pch = 20, col = "green", PF.pch = 17,
##D                            PF.points.col = "green", PF.line.col = "green"))
##D text(omEGO2$values[,1], omEGO2$values[,2], labels = 1:nsteps, pos = 3, col = "green")
##D plotGPareto(res = omEGO3, add = TRUE,
##D             control = list(pch = 20, col = "red", PF.pch = 17,
##D                            PF.points.col = "red", PF.line.col = "red"))
##D text(omEGO3$values[,1], omEGO3$values[,2], labels = 1:nsteps, pos = 3, col = "red") 
##D plotGPareto(res = omEGO4, add = TRUE,
##D             control = list(pch = 20, col = "orange", PF.pch = 17,
##D                            PF.points.col = "orange", PF.line.col = "orange"))
##D text(omEGO4$values[,1], omEGO4$values[,2], labels = 1:nsteps, pos = 3, col = "orange")
##D points(response.grid[,1], response.grid[,2], col = "black", pch = 20)
##D legend("topright", c("EHI", "SMS", "SUR", "EMI"), col = c("blue", "green", "red", "orange"),
##D  pch = rep(17,4))
##D  
##D  
##D # Post-processing
##D plotGPareto(res = omEGO1, UQ_PF = TRUE, UQ_PS = TRUE, UQ_dens = TRUE)
##D 
##D ################################################
##D # NOISY PROBLEMS
##D ################################################
##D set.seed(25468)
##D library(DiceDesign)
##D d <- 2 
##D nsteps <- 3
##D lower <- rep(0, d)
##D upper <- rep(1, d)
##D optimcontrol <- list(method = "pso", maxit = 20)
##D critcontrol <- list(refPoint = c(1, 10))
##D 
##D n.grid <- 21
##D test.grid <- expand.grid(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid))
##D n.init <- 30
##D design <- maximinESE_LHS(lhsDesign(n.init, d, seed = 42)$design)$design
##D 
##D fit.models <- function(u) km(~., design = design, response = response[, u],
##D                              noise.var=design.noise.var[,u])
##D 
##D # Test 1: EHI, constant noise.var
##D noise.var <- c(0.1, 0.2)
##D funnoise1 <- function(x) {ZDT3(x) + sqrt(noise.var)*rnorm(n=d)}
##D response <- t(apply(design, 1, funnoise1))
##D design.noise.var <- matrix(rep(noise.var, n.init), ncol=d, byrow=TRUE)
##D model <- lapply(1:d, fit.models)
##D 
##D omEGO1 <- GParetoptim(model = model, fn = funnoise1, crit = "EHI", nsteps = nsteps,
##D                       lower = lower, upper = upper, critcontrol = critcontrol,
##D                       reinterpolation=TRUE, noise.var=noise.var, optimcontrol = optimcontrol)
##D plotGPareto(omEGO1)
##D 
##D # Test 2: EMI, noise.var given by fn
##D funnoise2 <- function(x) {list(ZDT3(x) + sqrt(0.05 + abs(0.1*x))*rnorm(n=d), 0.05 + abs(0.1*x))}
##D temp <- funnoise2(design)
##D response <- temp[[1]]
##D design.noise.var <- temp[[2]]
##D model <- lapply(1:d, fit.models)
##D 
##D omEGO2 <- GParetoptim(model = model, fn = funnoise2, crit = "EMI", nsteps = nsteps,
##D                       lower = lower, upper = upper, critcontrol = critcontrol,
##D                       reinterpolation=TRUE, noise.var="given_by_fn", optimcontrol = optimcontrol)
##D plotGPareto(omEGO2)
##D 
##D # Test 3: SMS, functional noise.var
##D funnoise3 <- function(x) {ZDT3(x) + sqrt(0.025 + abs(0.05*x))*rnorm(n=d)}
##D noise.var <- function(x) return(0.025 + abs(0.05*x))
##D response <- t(apply(design, 1, funnoise3))
##D design.noise.var <- t(apply(design, 1, noise.var))
##D model <- lapply(1:d, fit.models)
##D 
##D omEGO3 <- GParetoptim(model = model, fn = funnoise3, crit = "SMS", nsteps = nsteps,
##D                            lower = lower, upper = upper, critcontrol = critcontrol,
##D                            reinterpolation=TRUE, noise.var=noise.var, optimcontrol = optimcontrol)
##D plotGPareto(omEGO3)
##D 
##D # Test 4: SUR, fastfun, constant noise.var
##D noise.var <- 0.1
##D funnoise4 <- function(x) {ZDT3(x)[1] + sqrt(noise.var)*rnorm(1)}
##D cheapfn <- function(x) ZDT3(x)[2]
##D response <- apply(design, 1, funnoise4)
##D design.noise.var <- rep(noise.var, n.init)
##D model <- list(km(~., design = design, response = response, noise.var=design.noise.var))
##D 
##D omEGO4 <- GParetoptim(model = model, fn = funnoise4, cheapfn = cheapfn, crit = "SUR", 
##D                       nsteps = nsteps, lower = lower, upper = upper, critcontrol = critcontrol,
##D                       reinterpolation=TRUE, noise.var=noise.var, optimcontrol = optimcontrol)
##D  plotGPareto(omEGO4)
##D                             
##D  # Test 5: EMI, fastfun, noise.var given by fn
##D  funnoise5 <- function(x) {
##D    if (is.null(dim(x))) x <- matrix(x, nrow=1)
##D    list(apply(x, 1, ZDT3)[1,] + sqrt(abs(0.05*x[,1]))*rnorm(nrow(x)), abs(0.05*x[,1]))
##D  }
##D  
##D  cheapfn <- function(x) {
##D    if (is.null(dim(x))) x <- matrix(x, nrow=1)
##D    apply(x, 1, ZDT3)[2,]
##D  }
##D  
##D  temp <- funnoise5(design)
##D  response <- temp[[1]]
##D  design.noise.var <- temp[[2]]
##D  model <- list(km(~., design = design, response = response, noise.var=design.noise.var))
##D  
##D  omEGO5 <- GParetoptim(model = model, fn = funnoise5, cheapfn = cheapfn, crit = "EMI", 
##D                        nsteps = nsteps, lower = lower, upper = upper, critcontrol = critcontrol,
##D                        reinterpolation=TRUE, noise.var="given_by_fn", optimcontrol = optimcontrol)
##D  plotGPareto(omEGO5)               
##D  
##D  # Test 6: EHI, fastfun, functional noise.var
##D  noise.var <- 0.1
##D  funnoise6 <- function(x) {ZDT3(x)[1] + sqrt(abs(0.1*x[1]))*rnorm(1)}
##D  noise.var <- function(x) return(abs(0.1*x[1]))
##D  cheapfn <- function(x) ZDT3(x)[2]
##D  response <- apply(design, 1, funnoise6)
##D  design.noise.var <- t(apply(design, 1, noise.var))
##D  model <- list(km(~., design = design, response = response, noise.var=design.noise.var))
##D  
##D  omEGO6 <- GParetoptim(model = model, fn = funnoise6, cheapfn = cheapfn, crit = "EMI", 
##D                        nsteps = nsteps, lower = lower, upper = upper, critcontrol = critcontrol,
##D                        reinterpolation=TRUE, noise.var=noise.var, optimcontrol = optimcontrol)
##D  plotGPareto(omEGO6)    
## End(Not run)



