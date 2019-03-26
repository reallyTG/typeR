library(rodd)


### Name: tpopt
### Title: Calculation of optimal discriminating design
### Aliases: tpopt
### Keywords: discriminative designs

### ** Examples

### Auxiliary libraries for examples
library(mvtnorm)
### EMAX vs MM
#List of models
eta.1 <- function(x, theta.1) 
    theta.1[1] + theta.1[2] * x / (x + theta.1[3])

eta.2 <- function(x, theta.2) 
    theta.2[1] * x / (x + theta.2[2])

eta <- list(eta.1, eta.2)

#List of fixed parameters
theta.1 <- c(1, 1, 1)
theta.2 <- c(1, 1)
theta.fix <- list(theta.1, theta.2)

#Comparison table
p <- matrix(
    c(
        0, 1,
        0, 0
    ), c(2, 2), byrow = TRUE)

#Design estimation
res <- tpopt(x = c(1.2, 1.5, 1.7), eta = eta, theta.fix = theta.fix, p = p, 
    x.lb = 1, x.rb = 2)

plot(res)
summary(res)

### Sigmoidal second
#List of models
eta.1 <- function(x, theta.1)
    theta.1[1] / (1 + theta.1[2] * exp(-theta.1[3] * x)) ^ theta.1[4]
    
eta.2 <- function(x, theta.2)
    theta.2[1] / (1 + theta.2[2] * exp(-theta.2[3] * x))

eta <- list(eta.1, eta.2)

#List of fixed parameters
theta.1 <- c(2, 5, 1, 2)
theta.2 <- c(3, 5, 0.7)
theta.fix <- list(theta.1, theta.2)

#Comparison table
p <- matrix(
    c(  
        0, 1,
        0, 0 
    ), c(2, 2), byrow = TRUE)

#Design estimation
res <- tpopt(x = seq(0, 10), eta = eta, theta.fix = theta.fix, p = p)

plot(res)
summary(res)

### Sigmoidal first
#List of models
eta.1 <- function(x, theta.1)
    theta.1[1] - theta.1[2] * exp(-theta.1[3] * x ^ theta.1[4])

eta.2 <- function(x, theta.2)
    theta.2[1] - theta.2[2] * exp(-theta.2[3] * x)

eta <- list(eta.1, eta.2)

#List of fixed parameters
theta.1 <- c(2, 1, 0.8, 1.5)
theta.2 <- c(2, 1, 1)
theta.fix <- list(theta.1, theta.2)

#Comparision table
p <- matrix(
    c(
        0, 1,
        0, 0
    ), c(2, 2), byrow = TRUE)

#Design estimation
res <- tpopt(x = seq(0, 10), eta = eta, theta.fix = theta.fix, p = p)

plot(res)
summary(res)

### Sigmoidal first --- Bayes

#List of fixed parameters
sigma <- sqrt(0.3)
theta.1.sigma <- matrix(
    c(
        sigma^2, 0,
        0, sigma^2
    ), c(2, 2), byrow = TRUE)
grid <- expand.grid(
    theta.1[1],
    theta.1[2],
    seq(theta.1[3] - sigma, theta.1[3] + sigma, length.out = 5),
    seq(theta.1[4] - sigma, theta.1[4] + sigma, length.out = 5)
    )

eta <- c(replicate(length(grid[,1]), eta.1, simplify = FALSE), eta.2)

theta.fix <- list()
for(i in 1:length(grid[,1]))
    theta.fix[[length(theta.fix) + 1]] <- as.numeric(grid[i,])
theta.fix[[length(theta.fix) + 1]] <- theta.2

density.on.grid <- dmvnorm(grid[,3:4], mean = theta.1[3:4], sigma = theta.1.sigma)
density.on.grid <- density.on.grid / sum(density.on.grid)

#Comparison table
p <- rep(0,length(eta))
for(i in 1:length(grid[,1]))
    p <- rbind(p, c(rep(0,length(eta) - 1), density.on.grid[i]))
p <- rbind(p, rep(0,length(eta)))
p <- p[-1,]

res <- tpopt(x = seq(0, 10), eta = eta, theta.fix = theta.fix, p = p)

plot(res)
summary(res)

### Dose response study 
#List of models
eta.1 <- function(x, theta.1)
    theta.1[1] + theta.1[2] * x

eta.2 <- function(x, theta.2)
    theta.2[1] + theta.2[2] * x * (theta.2[3] - x)

eta.3 <- function(x, theta.3)
    theta.3[1] + theta.3[2] * x / (theta.3[3] + x)

eta.4 <- function(x, theta.4)
    theta.4[1] + theta.4[2] / (1 + exp((theta.4[3] - x) / theta.4[4]))

eta <- list(eta.1, eta.2, eta.3, eta.4)

#List of fixed parameters
theta.1 <- c(60, 0.56)
theta.2 <- c(60, 7/2250, 600)
theta.3 <- c(60, 294, 25)
theta.4 <- c(49.62, 290.51, 150, 45.51)

theta.fix <- list(theta.1, theta.2, theta.3, theta.4)

#Comparison table
p <- matrix(
    c(
        0, 0, 0, 0,
        1, 0, 0, 0,
        1, 1, 0, 0,
        1, 1, 1 ,0
    ), c(4, 4), byrow = TRUE)

#Design estimation
res <- tpopt(x = seq(0, 500, 100), eta = eta, theta.fix = theta.fix, p = p)

plot(res)
summary(res)

### Dose response study --- Bayes

#List of fixed parameters
sigma <- 37
theta.4.sigma <- matrix(
    c(
        sigma^2, 0, 0, 0,
        0, sigma^2, 0, 0,
        0, 0, sigma^2, 0,
        0, 0, 0, sigma^2
    ), c(4, 4), byrow = TRUE)
grid <- expand.grid(
    seq(theta.4[1] - sigma, theta.4[1] + sigma, length.out = 3),
    seq(theta.4[2] - sigma, theta.4[2] + sigma, length.out = 3),
    seq(theta.4[3] - sigma, theta.4[3] + sigma, length.out = 3),
    seq(theta.4[4] - sigma, theta.4[4] + sigma, length.out = 3)
    )

eta <- c(eta.1, eta.2, eta.3, replicate(length(grid[,1]), eta.4, simplify = FALSE))

theta.fix <- list(theta.1, theta.2, theta.3)
for(i in 1:length(grid[,1]))
    theta.fix[[length(theta.fix) + 1]] <- as.numeric(grid[i,])

density.on.grid <- dmvnorm(grid, mean = theta.4, sigma = theta.4.sigma)
density.on.grid <- density.on.grid / sum(density.on.grid)

#Comparison table
p <- rbind(
    rep(0, length(eta)), 
    c(1, rep(0, length(eta) - 1)), 
    c(1, 1, rep(0,length(eta) - 2))
    )
for(i in 1:length(grid[,1]))
    p <- rbind(p, c(rep(density.on.grid[i], 3), rep(0, length(eta) - 3)))

#Design estimation
## Not run: 
##D res <- tpopt(x = seq(0, 500, 100), eta = eta, theta.fix = theta.fix, p = p)
## End(Not run)

plot(res)
summary(res)

## Not run: 
##D ### Example from [8]
##D ### An example of how case 2 can be computed for example 1 in [8] with tpopt function
##D 
##D #List of models
##D eta.1 <- function(x, theta.1) 
##D     log(theta.1[1] * x + theta.1[2] * x / (x + theta.1[3]))
##D 
##D eta.2 <- function(x, theta.2) 
##D     log(theta.2[1] * x / (x + theta.2[2]))
##D 
##D eta <- list(eta.1, eta.2)
##D     
##D #List of fixed parameters
##D theta.1 <- c(1, 1, 1)
##D theta.2 <- c(1, 1)
##D theta.fix <- list(theta.1, theta.2)
##D 
##D #Comparison table
##D p <- matrix(
##D     c(
##D         0,1,
##D         0,0
##D     ), c(length(eta), length(eta)), byrow = TRUE)
##D 
##D #Case 2, method 1
##D #Design estimation
##D res <- tpopt(
##D     x = seq(0.1, 5, length.out = 10), 
##D     eta = eta, theta.fix = theta.fix, p = p, x.lb = 0.1, x.rb = 5, 
##D     opt = list(method = 1)
##D )
##D plot(res)
##D summary(res)
##D 
##D #Case 2, method 2
##D #Design estimation
##D res <- tpopt(
##D     x = seq(0.1, 5, length.out = 10), 
##D     eta = eta, theta.fix = theta.fix, p = p, x.lb = 0.1, x.rb = 5, 
##D     opt = list(method = 2)
##D )
##D plot(res)
##D summary(res)
## End(Not run)



