library(FME)


### Name: pseudoOptim
### Title: Pseudo-random Search Optimisation Algorithm of Price (1977)
### Aliases: pseudoOptim
### Keywords: optimize

### ** Examples

amp    <- 6
period <- 5
phase  <- 0.5

x <- runif(20)*13 
y <- amp*sin(2*pi*x/period+phase) + rnorm(20, mean = 0, sd = 0.05)
plot(x, y, pch = 16)


cost <- function(par)
    sum((par[1] * sin(2*pi*x/par[2]+par[3])-y)^2)

p1 <- optim(par = c(amplitude = 1, phase = 1, period = 1), fn = cost)
p2 <- optim(par = c(amplitude = 1, phase = 1, period = 1), fn = cost, 
            method = "SANN")
p3 <- pseudoOptim(p = c(amplitude = 1, phase = 1, period = 1), 
            lower = c(0, 1e-8, 0), upper = c(100, 2*pi, 100), 
            f = cost, control = c(numiter = 3000, verbose = TRUE))

curve(p1$par[1]*sin(2*pi*x/p1$par[2]+p1$par[3]), lty = 2, add = TRUE)
curve(p2$par[1]*sin(2*pi*x/p2$par[2]+p2$par[3]), lty = 3, add = TRUE)
curve(p3$par[1]*sin(2*pi*x/p3$par[2]+p3$par[3]), lty = 1, add = TRUE)
legend ("bottomright", lty = c(1, 2, 3),
         c("Price", "Mathematical", "Simulated annealing"))


