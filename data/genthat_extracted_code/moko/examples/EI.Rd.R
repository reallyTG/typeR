library(moko)


### Name: EI
### Title: Constrained Expected Improvement
### Aliases: EI

### ** Examples

# --------------------------------------------
# Branin-Hoo function (with simple constraint)
# --------------------------------------------
n <- 10
d <- 2
doe <- replicate(d,sample(0:n,n))/n
fun_cost <- DiceKriging::branin
fun_cntr <- function(x) 0.2 - prod(x)
fun <- function(x) return(cbind(fun_cost(x),fun_cntr(x)))
res <- t(apply(doe, 1, fun))
model <- mkm(doe, res, modelcontrol = list(objective = 1, lower=c(0.1,0.1)))
grid <- expand.grid(seq(0,1,,25),seq(0,1,,25))
ei <- apply(grid, 1, EI, model) # this computation may take some time
contour(matrix(ei,25))
points(model@design, col=ifelse(model@feasible,'blue','red'))
points(grid[which.max(ei),], col='green')



