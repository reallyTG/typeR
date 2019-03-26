library(GPareto)


### Name: crit_optimizer
### Title: Maximization of multiobjective infill criterion
### Aliases: crit_optimizer

### ** Examples

## Not run: 
##D #---------------------------------------------------------------------------
##D # EHI surface associated with the "P1" problem at a 15 points design
##D #---------------------------------------------------------------------------
##D 
##D set.seed(25468)
##D library(DiceDesign)
##D 
##D d <- 2
##D n.obj <- 2 
##D fname <- "P1" 
##D n.grid <- 51
##D test.grid <- expand.grid(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid))
##D nappr <- 15 
##D design.grid <- round(maximinESE_LHS(lhsDesign(nappr, d, seed = 42)$design)$design, 1)
##D response.grid <- t(apply(design.grid, 1, fname))
##D paretoFront <- t(nondominated_points(t(response.grid)))
##D mf1 <- km(~., design = design.grid, response = response.grid[,1])
##D mf2 <- km(~., design = design.grid, response = response.grid[,2])
##D model <- list(mf1, mf2)
##D 
##D EHI_grid <- apply(test.grid, 1, crit_EHI, model = list(mf1, mf2),
##D                   critcontrol = list(refPoint = c(300, 0)))
##D 
##D lower <- rep(0, d)
##D upper <- rep(1, d)     
##D 
##D omEGO <- crit_optimizer(crit = "EHI", model = model,  lower = lower, upper = upper, 
##D                  optimcontrol = list(method = "genoud", pop.size = 200, BFGSburnin = 2),
##D                  critcontrol = list(refPoint = c(300, 0)))
##D                  
##D print(omEGO)
##D  
##D filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid), nlevels = 50,
##D                matrix(EHI_grid, nrow = n.grid), main = "Expected Hypervolume Improvement", 
##D                xlab = expression(x[1]), ylab = expression(x[2]), color = terrain.colors,
##D                plot.axes = {axis(1); axis(2);
##D                             points(design.grid[, 1], design.grid[, 2], pch = 21, bg = "white");
##D                             points(omEGO$par, col = "red", pch = 4)
##D                             }
##D               )
##D               
##D #---------------------------------------------------------------------------
##D # SMS surface associated with the "P1" problem at a 15 points design
##D #---------------------------------------------------------------------------
##D 
##D 
##D SMS_grid <- apply(test.grid, 1, crit_SMS, model = model,
##D                   critcontrol = list(refPoint = c(300, 0)))
##D 
##D lower <- rep(0, d)
##D upper <- rep(1, d)     
##D 
##D omEGO2 <- crit_optimizer(crit = "SMS", model = model,  lower = lower, upper = upper, 
##D                  optimcontrol = list(method="genoud", pop.size = 200, BFGSburnin = 2),
##D                  critcontrol = list(refPoint = c(300, 0)))
##D                  
##D print(omEGO2)
##D  
##D filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid), nlevels = 50,
##D                matrix(pmax(0,SMS_grid), nrow = n.grid), main = "SMS Criterion (>0)",
##D                xlab = expression(x[1]), ylab = expression(x[2]), color = terrain.colors,
##D                plot.axes = {axis(1); axis(2);
##D                             points(design.grid[, 1], design.grid[, 2], pch = 21, bg = "white");
##D                             points(omEGO2$par, col = "red", pch = 4)
##D                             }
##D               )
##D #---------------------------------------------------------------------------
##D # Maximin Improvement surface associated with the "P1" problem at a 15 points design
##D #---------------------------------------------------------------------------
##D 
##D 
##D EMI_grid <- apply(test.grid, 1, crit_EMI, model = model,
##D                   critcontrol = list(nb_samp = 20, type ="EMI"))
##D 
##D lower <- rep(0, d)
##D upper <- rep(1, d)     
##D 
##D omEGO3 <- crit_optimizer(crit = "EMI", model = model,  lower = lower, upper = upper, 
##D                  optimcontrol = list(method = "genoud", pop.size = 200, BFGSburnin = 2))
##D                  
##D print(omEGO3)
##D  
##D filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid), nlevels = 50,
##D                matrix(EMI_grid, nrow = n.grid), main = "Expected Maximin Improvement",
##D                xlab = expression(x[1]), ylab = expression(x[2]), color = terrain.colors, 
##D                plot.axes = {axis(1);axis(2);
##D                             points(design.grid[, 1], design.grid[, 2], pch = 21, bg = "white");
##D                             points(omEGO3$par, col = "red", pch = 4)
##D                             }
##D               )
##D #---------------------------------------------------------------------------
##D # crit_SUR surface associated with the "P1" problem at a 15 points design
##D #---------------------------------------------------------------------------
##D library(KrigInv)
##D 
##D integration.param <- integration_design_optim(lower = c(0, 0), upper = c(1, 1), model = model)
##D integration.points <- as.matrix(integration.param$integration.points)
##D integration.weights <- integration.param$integration.weights
##D 
##D precalc.data <- list()
##D mn.X <- sn.X <- matrix(0, n.obj, nrow(integration.points))
##D 
##D for (i in 1:n.obj){
##D   p.tst.all <- predict(model[[i]], newdata = integration.points, type = "UK",
##D                        checkNames = FALSE)
##D   mn.X[i,] <- p.tst.all$mean
##D   sn.X[i,]   <- p.tst.all$sd
##D   precalc.data[[i]] <- precomputeUpdateData(model[[i]], integration.points)
##D }
##D critcontrol <- list(integration.points = integration.points,
##D                     integration.weights = integration.weights,
##D                     mn.X = mn.X, sn.X = sn.X, precalc.data = precalc.data)
##D EEV_grid <- apply(test.grid, 1, crit_SUR, model=model, paretoFront = paretoFront,
##D                   critcontrol = critcontrol)
##D lower <- rep(0, d)
##D upper <- rep(1, d)
##D                   
##D omEGO4 <- crit_optimizer(crit = "SUR", model = model,  lower = lower, upper = upper, 
##D                  optimcontrol = list(method = "genoud", pop.size = 200, BFGSburnin = 2))
##D print(omEGO4)
##D 
##D filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
##D                matrix(pmax(0,EEV_grid), n.grid), main = "EEV criterion", nlevels = 50,
##D                xlab = expression(x[1]), ylab = expression(x[2]), color = terrain.colors,
##D                plot.axes = {axis(1); axis(2);
##D                             points(design.grid[,1], design.grid[,2], pch = 21, bg = "white")
##D                             points(omEGO4$par, col = "red", pch = 4)
##D                             }
##D               )
##D 
##D # example using user defined optimizer, here L-BFGS-B from base optim
##D userOptim <- function(par, fn, lower, upper, control, ...){
##D   return(optim(par = par, fn = fn, method = "L-BFGS-B", lower = lower, upper = upper,
##D          control = control, ...))
##D }
##D omEGO4bis <- crit_optimizer(crit = "SUR", model = model,  lower = lower, upper = upper, 
##D                  optimcontrol = list(method = "userOptim"))
##D print(omEGO4bis)
##D 
##D 
##D #---------------------------------------------------------------------------
##D # crit_SMS surface with problem "P1" with 15 design points, using cheapfn
##D #---------------------------------------------------------------------------
##D 
##D # Optimization with fastfun: SMS with discrete search
##D # Separation of the problem P1 in two objectives: 
##D # the first one to be kriged, the second one with fastobj
##D 
##D # Definition of the fastfun
##D f2 <-   function(x){
##D   return(P1(x)[2])
##D }
##D  
##D SMS_grid_cheap <- apply(test.grid, 1, crit_SMS, model = list(mf1, fastfun(f2, design.grid)),
##D                         paretoFront = paretoFront, critcontrol = list(refPoint = c(300, 0)))
##D 
##D 
##D optimcontrol <- list(method = "pso")
##D model2 <- list(mf1)
##D omEGO5 <- crit_optimizer(crit = "SMS", model = model2,  lower = lower, upper = upper,
##D                          cheapfn = f2, critcontrol = list(refPoint = c(300, 0)),
##D                          optimcontrol = list(method = "genoud", pop.size = 200, BFGSburnin = 2))
##D print(omEGO5)
##D 
##D filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid), 
##D                matrix(pmax(0, SMS_grid_cheap), nrow = n.grid), nlevels = 50,
##D                main = "SMS criterion with cheap 2nd objective (>0)", xlab = expression(x[1]),
##D                ylab = expression(x[2]), color = terrain.colors,
##D                plot.axes = {axis(1); axis(2);
##D                             points(design.grid[,1], design.grid[,2], pch = 21, bg = "white")
##D                             points(omEGO5$par, col = "red", pch = 4)
##D                             }
##D               )
## End(Not run)



