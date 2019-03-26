library(DiceOptim)


### Name: easyEGO.cst
### Title: EGO algorithm with constraints
### Aliases: easyEGO.cst

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
constraint <- function(x){return(c(fun1.cst(x), fun2.cst(x)))}

# For illustration purposes
n.grid <- 31
test.grid <- expand.grid(X1 = seq(0, 1, length.out = n.grid), X2 = seq(0, 1, length.out = n.grid))
obj.grid <- apply(test.grid, 1, fun)
cst1.grid <- apply(test.grid, 1, fun1.cst)
cst2.grid <- apply(test.grid, 1, fun2.cst)

lower <- rep(0, n_var)
upper <- rep(1, n_var)

#---------------------------------------------------------------------------
# 1- Expected Feasible Improvement criterion, expensive objective function,
# two inequality constraints, 15 observations budget, using genoud
#---------------------------------------------------------------------------
res <- easyEGO.cst(fun=fun, constraint=constraint, n.cst=2, lower=lower, upper=upper, budget=15,
                   control=list(method="EFI", inneroptim="genoud", maxit=20))

cat("best design found:", res$par, "\n")
cat("corresponding objective and constraints:", res$value, "\n")

# Objective function in colour, constraint boundaries in red
# Initial DoE: white circles, added points: blue crosses, best solution: red cross

filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid), nlevels = 50,
               matrix(obj.grid, n.grid), main = "Two inequality constraints",
               xlab = expression(x[1]), ylab = expression(x[2]), color = terrain.colors,
               plot.axes = {axis(1); axis(2);
                            points(design.grid[,1], design.grid[,2], pch = 21, bg = "white")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                                    matrix(cst1.grid, n.grid), level = 0, add=TRUE,
                                    drawlabels=FALSE, lwd=1.5, col = "red")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                                    matrix(cst2.grid, n.grid), level = 0, add=TRUE,drawlabels=FALSE,
                                    lwd=1.5, col = "red")
                            points(res$history$X, col = "blue", pch = 4, lwd = 2)
                            points(res$par[1], res$par[2], col = "red", pch = 4, lwd = 2, cex=2)
               }
)

#---------------------------------------------------------------------------
# 2- Augmented Lagrangian Improvement criterion, expensive objective function,
# one inequality and one equality constraint, 25 observations budget, using random search
#---------------------------------------------------------------------------
res2 <- easyEGO.cst(fun=fun, constraint=constraint, n.cst=2, lower=lower, upper=upper, budget=25,
                   equality = c(TRUE, FALSE),
                   control=list(method="AL", inneroptim="random", maxit=100))

cat("best design found:", res2$par, "\n")
cat("corresponding objective and constraints:", res2$value, "\n")

# Objective function in colour, inequality constraint boundary in red, equality
# constraint in orange
# Initial DoE: white circles, added points: blue crosses, best solution: red cross

filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid), nlevels = 50,
               matrix(obj.grid, n.grid), xlab = expression(x[1]), ylab = expression(x[2]),
               main = "Inequality (red) and equality (orange) constraints", color = terrain.colors,
               plot.axes = {axis(1); axis(2);
                            points(design.grid[,1], design.grid[,2], pch = 21, bg = "white")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                                    matrix(cst1.grid, n.grid), level = 0, add=TRUE,
                                    drawlabels=FALSE,lwd=1.5, col = "orange")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                                    matrix(cst2.grid, n.grid), level = 0, add=TRUE,
                                    drawlabels=FALSE,lwd=1.5, col = "red")
                            points(res2$history$X, col = "blue", pch = 4, lwd = 2)
                            points(res2$par[1], res2$par[2], col = "red", pch = 4, lwd = 2, cex=2)
               }
)

#---------------------------------------------------------------------------
# 3- Stepwise Uncertainty Reduction criterion, fast objective function,
# single inequality constraint, with initial DOE given + 10 observations,
# using genoud
#---------------------------------------------------------------------------
n.init <- 12
design.grid <- round(maximinESE_LHS(lhsDesign(n.init, n_var, seed = 42)$design)$design, 1)
cst2.init <- apply(design.grid, 1, fun2.cst)

res3 <- easyEGO.cst(fun=fun, constraint=fun2.cst, n.cst=1, lower=lower, upper=upper, budget=10,
                    X=design.grid, C=cst2.init,
                   cheapfun=TRUE, control=list(method="SUR", inneroptim="genoud", maxit=20))

cat("best design found:", res3$par, "\n")
cat("corresponding objective and constraint:", res3$value, "\n")

# Objective function in colour, inequality constraint boundary in red
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
                                    matrix(cst2.grid, n.grid), level = 0, add = TRUE,
                                    drawlabels = FALSE,lwd = 1.5, col = "red")
                            points(res3$history$X, col = "blue", pch = 4, lwd = 2)
                            points(res3$par[1], res3$par[2], col = "red", pch = 4, lwd = 2, cex=2)
                                           }
                )
## End(No test)



