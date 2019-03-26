library(DiceOptim)


### Name: EGO.cst
### Title: Sequential constrained Expected Improvement maximization and
###   model re-estimation, with a number of iterations fixed in advance by
###   the user
### Aliases: EGO.cst

### ** Examples

#---------------------------------------------------------------------------
# 2D objective function, 3 cases
#---------------------------------------------------------------------------
## No test: 
set.seed(25468)
library(DiceDesign)

n_var <- 2
fun <- goldsteinprice
fun1.cst <- function(x){return(-branin(x) + 25)}
fun2.cst <- function(x){return(3/2 - x[1] - 2*x[2] - .5*sin(2*pi*(x[1]^2 - 2*x[2])))}

# Constraint function with vectorial output
cstfun <- function(x){
  return(c(fun1.cst(x), fun2.cst(x)))
}

# For illustration purposes
n.grid <- 31
test.grid <- expand.grid(X1 = seq(0, 1, length.out = n.grid), X2 = seq(0, 1, length.out = n.grid))
obj.grid <- apply(test.grid, 1, fun)
cst1.grid <- apply(test.grid, 1, fun1.cst)
cst2.grid <- apply(test.grid, 1, fun2.cst)

# Initial set of observations and models
n.init <- 12
design.grid <- round(maximinESE_LHS(lhsDesign(n.init, n_var, seed = 42)$design)$design, 1)
obj.init <- apply(design.grid, 1, fun)
cst1.init <- apply(design.grid, 1, fun1.cst)
cst2.init <- apply(design.grid, 1, fun2.cst)
model.fun <- km(~., design = design.grid, response = obj.init)
model.constraint1 <- km(~., design = design.grid, response = cst1.init, lower=c(.2,.2))
model.constraint2 <- km(~., design = design.grid, response = cst2.init, lower=c(.2,.2))
model.constraint <- list(model.constraint1, model.constraint2)

lower <- rep(0, n_var)
upper <- rep(1, n_var)

#---------------------------------------------------------------------------
# 1- Expected Feasible Improvement criterion, expensive objective function,
# two inequality constraints, 5 iterations, using genoud
#---------------------------------------------------------------------------

cstEGO <- EGO.cst(model.fun = model.fun, fun = fun, model.constraint = model.constraint,
                  crit = "EFI", constraint = cstfun, equality = FALSE, lower = lower,
                  upper = upper, nsteps = 5, optimcontrol = list(method = "genoud", maxit = 20))

# Plots: objective function in colour, constraint boundaries in red
# Initial DoE: white circles, added points: blue crosses, best solution: red cross

filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid), nlevels = 50,
               matrix(obj.grid, n.grid), main = "Two inequality constraints",
               xlab = expression(x[1]), ylab = expression(x[2]), color = terrain.colors,
               plot.axes = {axis(1); axis(2);
                            points(design.grid[,1], design.grid[,2], pch = 21, bg = "white")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                                    matrix(cst1.grid, n.grid), level = 0, add=TRUE,drawlabels=FALSE,
                                    lwd=1.5, col = "red")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                                    matrix(cst2.grid, n.grid), level = 0, add=TRUE,drawlabels=FALSE,
                                    lwd=1.5, col = "red")
                            points(cstEGO$par, col = "blue", pch = 4, lwd = 2)
               }
)

#---------------------------------------------------------------------------
# 2- Augmented Lagrangian Improvement criterion, expensive objective function,
# one inequality and one equality constraint, using a discrete set of candidates (grid)
#---------------------------------------------------------------------------
cstEGO2 <- EGO.cst(model.fun = model.fun, fun = fun, model.constraint = model.constraint,
                   crit = "AL", constraint = cstfun, equality = c(TRUE, FALSE), lower = lower,
                   upper = upper, nsteps = 10,
                   critcontrol = list(tolConstraints = c(2, 0), always.update=TRUE),
                   optimcontrol=list(method="discrete", candidate.points=test.grid))

# Plots: objective function in colour, inequality constraint boundary in red,
# equality constraint in orange
# Initial DoE: white circles, added points: blue crosses, best solution: red cross

filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid), nlevels = 50,
               matrix(obj.grid, n.grid),
               main = "Inequality (red) and equality (orange) constraints",
               xlab = expression(x[1]), ylab = expression(x[2]), color = terrain.colors,
               plot.axes = {axis(1); axis(2);
                            points(design.grid[,1], design.grid[,2], pch = 21, bg = "white")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                                    matrix(cst1.grid, n.grid), level = 0, add=TRUE,
                                    drawlabels=FALSE,lwd=1.5, col = "orange")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                                    matrix(cst2.grid, n.grid), level = 0, add=TRUE,
                                    drawlabels=FALSE,lwd=1.5, col = "red")
                            points(cstEGO2$par, col = "blue", pch = 4, lwd = 2)
               }
)

#---------------------------------------------------------------------------
# 3- Stepwise Uncertainty Reduction criterion, fast objective function,
# single inequality constraint, 5 steps, importance sampling scheme
#---------------------------------------------------------------------------

cstEGO3 <- EGO.cst(model.fun = NULL, fun = NULL, cheapfun = fun,
                   model.constraint = model.constraint2, constraint = fun2.cst,
                   crit = "SUR", lower = lower, upper = upper,
                   nsteps =5, critcontrol=list(distrib="SUR"))

# Plots: objective function in colour, inequality constraint boundary in red,
# Initial DoE: white circles, added points: blue crosses, best solution: red cross

filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid), nlevels = 50,
               matrix(obj.grid, n.grid), main = "Single constraint, fast objective",
               xlab = expression(x[1]), ylab = expression(x[2]), color = terrain.colors,
               plot.axes = {axis(1); axis(2);
                            points(design.grid[,1], design.grid[,2], pch = 21, bg = "white")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                                    matrix(obj.grid, n.grid), nlevels = 10, add = TRUE,
                                    drawlabels = TRUE)
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                                    matrix(cst2.grid, n.grid), level = 0, add=TRUE,
                                    drawlabels=FALSE,lwd=1.5, col = "black")
                            points(cstEGO3$par, col = "blue", pch = 4, lwd = 2)
                                           }
                )
## End(No test)



