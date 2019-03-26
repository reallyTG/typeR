library(ecolMod)


### Name: pricefit
### Title: Pseudo-random search algorithm of Price (1997)
### Aliases: pricefit
### Keywords: optimize

### ** Examples
pricefit  # will display the code 

amp    <- 6
period <- 5
phase  <- 0.5

x <- runif(20)*13 
y <- amp*sin(2*pi*x/period+phase) + rnorm(20, mean = 0, sd = 0.05)
plot(x, y, pch = 16)


cost <- function(par) sum((par[1]*sin(2*pi*x/par[2]+par[3])-y)^2)

p1 <- optim(par = c(amplitude = 1, phase = 1, period = 1), cost)
p2 <- optim(par = c(amplitude = 1, phase = 1, period = 1), cost,
            method = "SANN")
p3 <- pricefit(par = c(amplitude = 1, phase = 1, period = 1),
            minpar = c(0, 1e-8,0), maxpar = c(100, 2*pi,100), 
            func = cost, numiter = 3000)

curve(p1$par[1]*sin(2*pi*x/p1$par[2] + p1$par[3]), lty = 2, add = TRUE)
curve(p2$par[1]*sin(2*pi*x/p2$par[2] + p2$par[3]), lty = 3, add = TRUE)
curve(p3$par[1]*sin(2*pi*x/p3$par[2] + p3$par[3]), lty = 1, add = TRUE)

legend ("bottomright", lty = c(1, 2, 3),
        c("Price", "Mathematical", "Simulated annealing"))


