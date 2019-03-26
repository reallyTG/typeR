library(moko)


### Name: max_EI
### Title: max_EI: Maximization of the Constrained Expected Improvement
###   criterion
### Aliases: max_EI

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
max_EI(model)



