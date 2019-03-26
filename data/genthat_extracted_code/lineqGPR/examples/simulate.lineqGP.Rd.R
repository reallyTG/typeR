library(lineqGPR)


### Name: simulate.lineqGP
### Title: Simulation Method for the '"lineqGP"' S3 Class
### Aliases: simulate.lineqGP

### ** Examples

# creating the model
sigfun <- function(x) return(1/(1+exp(-7*(x-0.5))))
x <- seq(0, 1, length = 5)
y <- sigfun(x)
model <- create(class = "lineqGP", x, y, constrType = "monotonicity")

# updating and expanding the model
model$localParam$m <- 30
model$kernParam$par <- c(1, 0.2)
model <- augment(model)

# sampling from the model
xtest <- seq(0, 1, length = 100)
ytest <- sigfun(xtest)
sim.model <- simulate(model, nsim = 50, seed = 1, xtest = xtest)
mu <- apply(sim.model$ysim, 1, mean)
qtls <- apply(sim.model$ysim, 1, quantile, probs = c(0.05, 0.95))
matplot(xtest, t(qtls), type = "l", lty = 1, col = "gray90",
        main = "Constrained Kriging model")
polygon(c(xtest, rev(xtest)), c(qtls[2,], rev(qtls[1,])), col = "gray90", border = NA)
lines(xtest, ytest, lty = 2)
lines(xtest, mu, type = "l", col = "darkgreen")
points(x, y, pch = 20)
legend("right", c("ytrain", "ytest", "mean", "confidence"), lty = c(NaN,2,1,NaN),
       pch = c(20,NaN,NaN,15), col = c("black", "black", "darkgreen", "gray80"))




