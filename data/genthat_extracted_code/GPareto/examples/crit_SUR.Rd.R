library(GPareto)


### Name: crit_SUR
### Title: Analytical expression of the SUR criterion for two or three
###   objectives.
### Aliases: crit_SUR

### ** Examples

#---------------------------------------------------------------------------
# crit_SUR surface associated with the "P1" problem at a 15 points design
#---------------------------------------------------------------------------
set.seed(25468)
library(DiceDesign)
library(KrigInv)

n_var <- 2 
n.obj <- 2 
f_name <- "P1" 
n.grid <- 14
test.grid <- expand.grid(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid))
n_appr <- 15 
design.grid <- round(maximinESE_LHS(lhsDesign(n_appr, n_var, seed = 42)$design)$design, 1)
response.grid <- t(apply(design.grid, 1, f_name))
paretoFront <- t(nondominated_points(t(response.grid)))
mf1 <- km(~., design = design.grid, response = response.grid[,1])
mf2 <- km(~., design = design.grid, response = response.grid[,2])

model <- list(mf1, mf2)


integration.param <- integration_design_optim(lower = c(0, 0), upper = c(1, 1), model = model)
integration.points <- as.matrix(integration.param$integration.points)
integration.weights <- integration.param$integration.weights

precalc.data <- list()
mn.X <- sn.X <- matrix(0, nrow = n.obj, ncol = nrow(integration.points))

for (i in 1:n.obj){
  p.tst.all <- predict(model[[i]], newdata = integration.points, type = "UK", checkNames = FALSE)
  mn.X[i,] <- p.tst.all$mean
  sn.X[i,]   <- p.tst.all$sd
  precalc.data[[i]] <- precomputeUpdateData(model[[i]], integration.points)
}

critcontrol <- list(integration.points = integration.points,
                    integration.weights = integration.weights,
                    mn.X = mn.X, sn.X = sn.X, precalc.data = precalc.data)
## Alternatively: critcontrol <- list(lower = rep(0, n_var), upper = rep(1,n_var))
                
EEV_grid <- apply(test.grid, 1, crit_SUR, model = model, paretoFront = paretoFront,
                  critcontrol = critcontrol)
                  

filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
               matrix(pmax(0,EEV_grid), nrow = n.grid), main = "EEV criterion",
               xlab = expression(x[1]), ylab = expression(x[2]), color = terrain.colors,
               plot.axes = {axis(1); axis(2);
                            points(design.grid[,1], design.grid[,2], pch = 21, bg = "white")
                            }
              )         



