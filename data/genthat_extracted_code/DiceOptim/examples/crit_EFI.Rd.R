library(DiceOptim)


### Name: crit_EFI
### Title: Expected Feasible Improvement
### Aliases: crit_EFI

### ** Examples

#---------------------------------------------------------------------------
# Expected Feasible Improvement surface with one inequality constraint
#---------------------------------------------------------------------------
## No test: 
set.seed(25468)
library(DiceDesign)

n_var <- 2
fun.obj <- goldsteinprice
fun.cst <- function(x){return(-branin(x) + 25)}
n.grid <- 51
test.grid <- expand.grid(X1 = seq(0, 1, length.out = n.grid), X2 = seq(0, 1, length.out = n.grid))
obj.grid <- apply(test.grid, 1, fun.obj)
cst.grid <- apply(test.grid, 1, fun.cst)
n.init <- 15
design.grid <- round(maximinESE_LHS(lhsDesign(n.init, n_var, seed = 42)$design)$design, 1)
obj.init <- apply(design.grid, 1, fun.obj)
cst.init <- apply(design.grid, 1, fun.cst)
model.fun <- km(~., design = design.grid, response = obj.init)
model.constraint <- km(~., design = design.grid, response = cst.init)

EFI_grid <- apply(test.grid, 1, crit_EFI, model.fun = model.fun,
                  model.constraint = model.constraint)

filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid), nlevels = 50,
               matrix(EFI_grid, n.grid), main = "Expected Feasible Improvement",
               xlab = expression(x[1]), ylab = expression(x[2]), color = terrain.colors,
               plot.axes = {axis(1); axis(2);
                            points(design.grid[,1], design.grid[,2], pch = 21, bg = "white")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                            matrix(obj.grid, n.grid), nlevels = 10,
                                   add=TRUE,drawlabels=TRUE, col = "black")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                            matrix(cst.grid, n.grid), level = 0, add=TRUE,
                                   drawlabels=FALSE,lwd=1.5, col = "red")
                            }
              )
## End(No test)
#---------------------------------------------------------------------------
# Expected Feasible Improvement surface with one inequality and one equality constraint
#---------------------------------------------------------------------------
## No test: 
set.seed(25468)
library(DiceDesign)

n_var <- 2
fun.obj <- goldsteinprice
fun.cstineq <- function(x){return(3/2 - x[1] - 2*x[2] - .5*sin(2*pi*(x[1]^2 - 2*x[2])))}
fun.csteq <- function(x){return(branin(x) - 25)}
n.grid <- 51
test.grid <- expand.grid(X1 = seq(0, 1, length.out = n.grid), X2 = seq(0, 1, length.out = n.grid))
obj.grid <- apply(test.grid, 1, fun.obj)
cstineq.grid <- apply(test.grid, 1, fun.cstineq)
csteq.grid <- apply(test.grid, 1, fun.csteq)
n.init <- 25
design.grid <- round(maximinESE_LHS(lhsDesign(n.init, n_var, seed = 42)$design)$design, 1)
obj.init <- apply(design.grid, 1, fun.obj)
cstineq.init <- apply(design.grid, 1, fun.cstineq)
csteq.init <- apply(design.grid, 1, fun.csteq)
model.fun <- km(~., design = design.grid, response = obj.init)
model.constraintineq <- km(~., design = design.grid, response = cstineq.init)
model.constrainteq <- km(~., design = design.grid, response = csteq.init)

models.cst <- list(model.constraintineq, model.constrainteq)

EFI_grid <- apply(test.grid, 1, crit_EFI, model.fun = model.fun, model.constraint = models.cst,
                  equality = c(FALSE, TRUE), critcontrol = list(tolConstraints = c(0.05, 3)))

filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid), nlevels = 50,
               matrix(EFI_grid, n.grid), main = "Expected Feasible Improvement",
               xlab = expression(x[1]), ylab = expression(x[2]), color = terrain.colors,
               plot.axes = {axis(1); axis(2);
                            points(design.grid[,1], design.grid[,2], pch = 21, bg = "white")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                            matrix(obj.grid, n.grid), nlevels = 10,
                                   add=TRUE,drawlabels=TRUE, col = "black")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                            matrix(cstineq.grid, n.grid), level = 0, add=TRUE,
                                   drawlabels=FALSE,lwd=1.5, col = "red")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                            matrix(csteq.grid, n.grid), level = 0, add=TRUE,
                                   drawlabels=FALSE,lwd=1.5, col = "orange")
                            }
              )
## End(No test)



