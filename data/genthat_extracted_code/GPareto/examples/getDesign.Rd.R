library(GPareto)


### Name: getDesign
### Title: Get design corresponding to an objective target
### Aliases: getDesign

### ** Examples

## Not run: 
##D 
##D #---------------------------------------------------------------------------
##D # Example of interactive optimization
##D #---------------------------------------------------------------------------
##D 
##D set.seed(25468)
##D library(DiceDesign)
##D 
##D d <- 2
##D n.obj <- 2 
##D fun <- "P1" 
##D n.grid <- 51
##D test.grid <- expand.grid(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid))
##D nappr <- 20 
##D design.grid <- round(maximinESE_LHS(lhsDesign(nappr, d, seed = 42)$design)$design, 1)
##D response.grid <- t(apply(design.grid, 1, fun))
##D paretoFront <- t(nondominated_points(t(response.grid)))
##D mf1 <- km(~., design = design.grid, response = response.grid[,1])
##D mf2 <- km(~., design = design.grid, response = response.grid[,2])
##D model <- list(mf1, mf2)
##D lower <- rep(0, d); upper <- rep(1, d)
##D 
##D sol <- GParetoptim(model, fun, crit = "SUR", nsteps = 5, lower = lower, upper = upper) 
##D 
##D plotGPareto(sol)
##D 
##D target1 <- c(15, -25)
##D points(x = target1[1], y = target1[2], col = "black", pch = 13)
##D 
##D nDesign <- getDesign(sol$lastmodel, target = target1, lower = rep(0, d), upper = rep(1, d))
##D points(t(nDesign$mean), col = "green", pch = 20)
##D 
##D target2 <- c(48, -27)
##D points(x = target2[1], y = target2[2], col = "black", pch = 13)
##D nDesign2 <- getDesign(sol$lastmodel, target = target2, lower = rep(0, d), upper = rep(1, d))
##D points(t(nDesign2$mean), col = "darkgreen", pch = 20)
## End(Not run)



