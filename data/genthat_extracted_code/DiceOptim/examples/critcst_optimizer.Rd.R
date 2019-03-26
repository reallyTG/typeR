library(DiceOptim)


### Name: critcst_optimizer
### Title: Maximization of constrained Expected Improvement criteria
### Aliases: critcst_optimizer

### ** Examples

#---------------------------------------------------------------------------
# 2D objective function, 2 cases
#---------------------------------------------------------------------------
## No test: 
set.seed(2546)
library(DiceDesign)

n_var <- 2
fun <- branin

fun1.cst <- function(x){return(goldsteinprice(x)+.5)}
fun2.cst <- function(x){return(3/2 - x[1] - 2*x[2] - .5*sin(2*pi*(x[1]^2 - 2*x[2])))}

# Constraint function with vectorial output
cstfun <- function(x){return(c(fun1.cst(x), fun2.cst(x)))}

n.grid <- 31
test.grid <- expand.grid(X1 = seq(0, 1, length.out = n.grid), X2 = seq(0, 1, length.out = n.grid))
obj.grid <- apply(test.grid, 1, fun)
cst1.grid <- apply(test.grid, 1, fun1.cst)
cst2.grid <- apply(test.grid, 1, fun2.cst)

n_appr <- 12
design.grid <- round(maximinESE_LHS(lhsDesign(n_appr, n_var, seed = 2)$design)$design, 1)
obj.init <- apply(design.grid, 1, fun)
cst1.init <- apply(design.grid, 1, fun1.cst)
cst2.init <- apply(design.grid, 1, fun2.cst)
model.fun <- km(~., design = design.grid, response = obj.init)
model.constraint1 <- km(~., design = design.grid, response = cst1.init, lower=c(.2,.2))
model.constraint2 <- km(~., design = design.grid, response = cst2.init, lower=c(.2,.2))
models.cst <- list(model.constraint1, model.constraint2)

lower <- rep(0, n_var)
upper <- rep(1, n_var)

#---------------------------------------------------------------------------
# Augmented Lagrangian Improvement, fast objective function, two ineq constraints,
# optimization with genoud
#---------------------------------------------------------------------------
critcontrol <- list(lambda=c(.5,2), rho=.5)
optimcontrol <- list(method = "genoud", max.generations=10, pop.size=20)

AL_grid <- apply(test.grid, 1, crit_AL, model.fun = fastfun(fun, design.grid),
                 model.constraint = models.cst, critcontrol=critcontrol)

cstEGO1 <- critcst_optimizer(crit = "AL", model.fun = fun,
                             model.constraint = models.cst, equality = FALSE,
                             lower = lower, upper = upper,
                             optimcontrol = optimcontrol, critcontrol=critcontrol)

filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid), nlevels = 50,
               matrix(AL_grid, n.grid), main = "AL map and its maximizer (blue)",
               xlab = expression(x[1]), ylab = expression(x[2]), color = terrain.colors,
               plot.axes = {axis(1); axis(2);
                            points(design.grid[,1], design.grid[,2], pch = 21, bg = "white")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                            matrix(obj.grid, n.grid), nlevels = 10, add=TRUE,drawlabels=TRUE,
                                   col = "black")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                            matrix(cst1.grid, n.grid), level = 0, add=TRUE,drawlabels=FALSE,
                                   lwd=1.5, col = "red")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                            matrix(cst2.grid, n.grid), level = 0, add=TRUE,drawlabels=FALSE,
                                   lwd=1.5, col = "red")
                            points(cstEGO1$par, col = "blue", pch = 4, lwd = 2)
                            }
              )
#---------------------------------------------------------------------------
# SUR, expensive objective function, one equality constraint,
# optimization with genoud, integration on a regular grid
#---------------------------------------------------------------------------
optimcontrol <- list(method = "genoud", s = 40, maxit = 40)
critcontrol  <- list(tolConstraints = .15, integration.points=as.matrix(test.grid))

SUR_grid <- apply(test.grid, 1, crit_SUR_cst, model.fun = model.fun,
                  model.constraint = model.constraint1, equality = TRUE, critcontrol = critcontrol)

cstEGO2 <- critcst_optimizer(crit = "SUR", model.fun = model.fun,
                             model.constraint = model.constraint1, equality = TRUE,
                             lower = lower, upper = upper,
                             optimcontrol = optimcontrol, critcontrol = critcontrol)

filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid), nlevels = 50,
               matrix(SUR_grid, n.grid), main = "SUR map and its maximizer (blue)",
               xlab = expression(x[1]), ylab = expression(x[2]), color = terrain.colors,
               plot.axes = {axis(1); axis(2);
                            points(design.grid[,1], design.grid[,2], pch = 21, bg = "white")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                            matrix(obj.grid, n.grid), nlevels = 10, add=TRUE,
                            drawlabels=TRUE, col = "black")
                            contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
                            matrix(cst1.grid, n.grid), level = c(-critcontrol$tolConstraints,
                            critcontrol$tolConstraints),
                            add=TRUE, drawlabels=FALSE,lwd=1.5, col = "orange")
                            points(cstEGO2$par, col = "blue", pch = 4, lwd = 2)
                            }
              )
## End(No test)



