library(Rfit)


### Name: jaeckel
### Title: Function to Minimize Jaeckel's Dispersion Function
### Aliases: jaeckel

### ** Examples

##  This is a internal function.  See rfit for user-level examples.

## The function is currently defined as
function (x, y, beta0 = rq(y ~ x - 1)$coef, scores = wscores, 
    maxiter = 100, irls0 = 10, BFGS0 = 20, stepCG = 5, stepBFGS = 2) 
{
    x <- x - outer(rep(1, nrow(x)), apply(x, 2, mean))
    beta0 <- irls(x, y, beta0, max.iter = irls0)
    if (BFGS0 < 1) 
        BFGS0 <- 1
    fit <- optim(beta0, disp, method = "BFGS", x = x, y = y, 
        scores = scores, control = list(maxit = BFGS0))
    iter <- 0
    while (fit$convergence && iter < maxiter) {
        iter <- iter + 1
        fit <- optim(fit$par, disp, method = "CG", x = x, y = y, 
            scores = scores, control = list(maxit = stepCG))
        fit <- optim(fit$par, disp, method = "BFGS", x = x, y = y, 
            scores = scores, control = list(maxit = stepBFGS))
    }
    optim(fit$par, disp, method = "BFGS", x = x, y = y, scores = scores)
  }



