library(trust)


### Name: trust
### Title: Non-Linear Optimization
### Aliases: trust
### Keywords: nonlinear optimize

### ** Examples

##### Rosenbrock's function #####
objfun <- function(x) {
    stopifnot(is.numeric(x))
    stopifnot(length(x) == 2)
    f <- expression(100 * (x2 - x1^2)^2 + (1 - x1)^2)
    g1 <- D(f, "x1")
    g2 <- D(f, "x2")
    h11 <- D(g1, "x1")
    h12 <- D(g1, "x2")
    h22 <- D(g2, "x2")
    x1 <- x[1]
    x2 <- x[2]
    f <- eval(f)
    g <- c(eval(g1), eval(g2))
    B <- rbind(c(eval(h11), eval(h12)), c(eval(h12), eval(h22)))
    list(value = f, gradient = g, hessian = B)
}

trust(objfun, c(3, 1), 1, 5)

##### function with restricted domain #####
d <- 5
mu <- 10 * seq(1, d)
objfun <- function(x) {
    normxsq <- sum(x^2)
    omnormxsq <- 1 - normxsq
    if (normxsq >= 1) return(list(value = Inf))
    f <- sum(x * mu) - log(omnormxsq)
    g <- mu + 2 * x / omnormxsq
    B <- 4 * outer(x, x) / omnormxsq^2 + 2 * diag(d) / omnormxsq
    list(value = f, gradient = g, hessian = B)
}

whoop <- trust(objfun, rep(0, d), 1, 100, blather = TRUE)
whoop$converged
whoop$iterations
data.frame(type = whoop$steptype, rho = whoop$rho, change = whoop$preddiff,
    accept = whoop$accept, r = whoop$r)

##### solution
whoop$argument
##### distance of solution from boundary
1 - sqrt(sum(whoop$argument^2))

##### fail when initial point not feasible
## Not run: trust(objfun, rep(0.5, d), 1, 100, blather = TRUE)



