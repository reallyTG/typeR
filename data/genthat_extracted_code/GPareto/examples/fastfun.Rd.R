library(GPareto)


### Name: fastfun
### Title: Fast-to-evaluate function wrapper
### Aliases: fastfun

### ** Examples

########################################################
## Example with a fast to evaluate objective
########################################################
## Not run: 
##D set.seed(25468)
##D library(DiceDesign)
##D 
##D d <- 2 
##D 
##D fname <- P1
##D n.grid <- 21
##D nappr <- 11 
##D design.grid <- maximinESE_LHS(lhsDesign(nappr, d, seed = 42)$design)$design
##D response.grid <- t(apply(design.grid, 1, fname))
##D Front_Pareto <- t(nondominated_points(t(response.grid)))
##D 
##D mf1 <- km(~., design = design.grid, response = response.grid[,1])
##D mf2 <- km(~., design = design.grid, response = response.grid[,2])
##D model <- list(mf1, mf2)
##D 
##D nsteps <- 5 
##D lower <- rep(0, d)
##D upper <- rep(1, d)
##D 
##D # Optimization reference: SMS with discrete search
##D optimcontrol <- list(method = "pso")
##D omEGO1 <- GParetoptim(model = model, fn = fname, crit = "SMS", nsteps = nsteps,
##D                      lower = lower, upper = upper, optimcontrol = optimcontrol)
##D print(omEGO1$par)
##D print(omEGO1$values)
##D plot(response.grid, xlim = c(0,300), ylim = c(-40,0), pch = 17, col = "blue")
##D points(omEGO1$values, pch = 20, col ="green") 
##D 
##D # Optimization with fastfun: SMS with discrete search
##D # Separation of the problem P1 in two objectives: 
##D # the first one to be kriged, the second one with fastobj
##D f1 <-   function(x){
##D   if(is.null(dim(x))) x <- matrix(x, nrow = 1) 
##D   b1 <- 15*x[,1] - 5
##D   b2 <- 15*x[,2]
##D   return(  (b2 - 5.1*(b1/(2*pi))^2 + 5/pi*b1 - 6)^2 +10*((1 - 1/(8*pi))*cos(b1) + 1))
##D }
##D 
##D f2 <-   function(x){
##D   if(is.null(dim(x))) x <- matrix(x, nrow = 1) 
##D   b1<-15*x[,1] - 5
##D   b2<-15*x[,2]
##D   return(-sqrt((10.5 - b1)*(b1 + 5.5)*(b2 + 0.5))
##D          - 1/30*(b2 - 5.1*(b1/(2*pi))^2 - 6)^2
##D          - 1/3*((1 - 1/(8*pi))*cos(b1) + 1)) 
##D }
##D 
##D optimcontrol <- list(method = "pso")
##D model2 <- list(mf1)
##D omEGO2 <- GParetoptim(model = model2, fn = f1, cheapfn = f2, crit = "SMS", nsteps = nsteps,
##D                      lower = lower, upper = upper, optimcontrol = optimcontrol)
##D print(omEGO2$par)
##D print(omEGO2$values)
##D 
##D points(omEGO2$values, col = "red", pch = 15)
## End(Not run)



