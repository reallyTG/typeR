library(rodd)


### Name: KLopt.lnorm
### Title: Calculation of KL-optimal discriminating design for lognormal
###   errors
### Aliases: KLopt.lnorm
### Keywords: discriminative designs

### ** Examples

## Not run: 
##D ### Examples from [8]
##D ### Cases 1 and 3 are presented here; case 2 can be computed using the
##D ### function tpopt (see the description of this function for exact example)
##D  
##D library(mvtnorm)
##D 
##D ### Example 1 from [8]; EMAX vs MM
##D 
##D #List of models
##D eta.1 <- function(x, theta.1) 
##D     theta.1[1] * x + theta.1[2] * x / (x + theta.1[3])
##D 
##D eta.2 <- function(x, theta.2) 
##D     theta.2[1] * x / (x + theta.2[2])
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
##D ### Case 1 
##D 
##D #List of variances
##D sq.var.1 <- function(x, theta.1)
##D     1
##D     
##D sq.var.2 <- function(x, theta.2)
##D     1
##D 
##D sq.var <- list(sq.var.1, sq.var.2)
##D     
##D #Case 1, method 1
##D res <- KLopt.lnorm(
##D     x = seq(0.1, 5, length.out = 10), 
##D     eta = eta, sq.var = sq.var, theta.fix = theta.fix, p = p,  
##D     opt = list(method = 1)
##D )
##D plot(res)
##D summary(res)
##D 
##D #Case 1, method 2
##D res <- KLopt.lnorm(
##D     x = seq(0.1, 5, length.out = 10), 
##D     eta = eta, sq.var = sq.var, theta.fix = theta.fix, p = p,  
##D     opt = list(method = 2)
##D )
##D plot(res)
##D summary(res)
##D 
##D ### case 3
##D #List of variances
##D sq.var.1 <- function(x, theta.1)
##D     exp(eta.1(x, theta.1))
##D     
##D sq.var.2 <- function(x, theta.2)
##D     exp(eta.2(x, theta.2))
##D 
##D sq.var <- list(sq.var.1, sq.var.2)
##D 
##D #Case 3, method 1
##D res <- KLopt.lnorm(
##D     x = seq(0.1, 5, length.out = 10), 
##D     eta = eta, sq.var = sq.var, theta.fix = theta.fix, p = p,  
##D     opt = list(method = 1)
##D )
##D plot(res)
##D summary(res)
##D 
##D #Case 3, method 2
##D res <- KLopt.lnorm(
##D     x = seq(0.1, 5, length.out = 10), 
##D     eta = eta, sq.var = sq.var, theta.fix = theta.fix, p = p,  
##D     opt = list(method = 2)
##D )
##D plot(res)
##D summary(res)
##D 
##D ### Example 2 from [8]; sigmoidal
##D 
##D #List of models
##D eta.1 = function(x, theta.1)
##D     theta.1[1] - theta.1[2] * exp(-theta.1[3] * x ^ theta.1[4])
##D 
##D eta.2 <- function(x, theta.2)
##D     theta.2[1] - theta.2[2] * exp(-theta.2[3] * x)
##D 
##D #List of fixed parameters
##D theta.1.mean <- c(2, 1, 0.8, 1.5)
##D sigma <- 0.3
##D theta.1.sigma <- matrix(
##D     c(
##D         sigma,0,
##D         0,sigma
##D     ), c(2, 2), byrow = TRUE)
##D grid <- expand.grid(
##D     theta.1.mean[1],
##D     theta.1.mean[2],
##D     seq(theta.1.mean[3] - sqrt(sigma), theta.1.mean[3] + sqrt(sigma), length.out = 5),
##D     seq(theta.1.mean[4] - sqrt(sigma), theta.1.mean[4] + sqrt(sigma), length.out = 5)
##D )
##D 
##D theta.2 <- c(2,1,1)
##D 
##D theta.fix <- list()
##D for(i in 1:length(grid[,1]))
##D     theta.fix[[length(theta.fix)+1]] <- as.numeric(grid[i,])
##D theta.fix[[length(theta.fix)+1]] <- theta.2
##D 
##D density.on.grid <- dmvnorm(grid[,3:4], mean = theta.1.mean[3:4], sigma = theta.1.sigma)
##D density.on.grid <- density.on.grid / sum(density.on.grid)
##D     
##D eta <- list()
##D for(i in 1:length(grid[,1]))
##D     eta <- c(eta, eta.1)
##D eta <- c(eta, eta.2)
##D 
##D #Comparison table
##D p <- rep(0,length(eta))
##D for(i in 1:length(grid[,1]))
##D     p <- rbind(p, c(rep(0,length(eta)-1), density.on.grid[i]))
##D p <- rbind(p, rep(0,length(eta)))
##D p <- p[-1,]
##D 
##D ### Case 1
##D 
##D sq.var.1 <- function(x, theta.1)
##D     1
##D 
##D sq.var.2 <- function(x, theta.2)
##D     1
##D 
##D sq.var <- list()
##D for(i in 1:length(grid[,1]))
##D     sq.var <- c(sq.var, sq.var.1)
##D sq.var <- c(sq.var, sq.var.2)
##D 
##D #Case 1, method 1
##D res <- KLopt.lnorm(
##D     x = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10), 
##D     eta = eta, sq.var = sq.var, theta.fix = theta.fix, p = p, 
##D     opt = list(method = 1)
##D )
##D plot(res)
##D summary(res)
##D 
##D #Case 1, method 2 
##D res <- KLopt.lnorm(
##D     x = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10), 
##D     eta = eta, sq.var = sq.var, theta.fix = theta.fix, p = p, 
##D     opt = list(method = 2)
##D )
##D plot(res)
##D summary(res)
##D 
##D ### Case 3
##D 
##D sq.var.1 <- function(x, theta.1)
##D     exp(eta.1(x, theta.1))
##D 
##D sq.var.2 <- function(x, theta.2)
##D     exp(eta.2(x, theta.2))
##D 
##D sq.var <- list()
##D for(i in 1:length(grid[,1]))
##D     sq.var <- c(sq.var, sq.var.1)
##D sq.var <- c(sq.var, sq.var.2)
##D 
##D #Case 3, method 1 
##D res <- KLopt.lnorm(
##D     x = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10), 
##D     eta = eta, sq.var = sq.var, theta.fix = theta.fix, p = p, 
##D     opt = list(method = 1)
##D )
##D plot(res)
##D summary(res)
##D 
##D #Case 3, method 2 
##D res <- KLopt.lnorm(
##D     x = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10), 
##D     eta = eta, sq.var = sq.var, theta.fix = theta.fix, p = p, 
##D     opt = list(method = 2)
##D )
##D plot(res)
##D summary(res)
##D 
##D ### Example 3 from [8]; dose response
##D 
##D #List of models
##D eta.1 <- function(x, theta.1)
##D     theta.1[1] + theta.1[2] * x
##D 
##D eta.2 <- function(x, theta.2)
##D     theta.2[1] + theta.2[2] * x * (theta.2[3] - x)
##D 
##D eta.3 <- function(x, theta.3)
##D     theta.3[1] + theta.3[2] * x / (theta.3[3] + x)
##D 
##D eta.4 <- function(x, theta.4)
##D     theta.4[1] + theta.4[2] / (1 + exp((theta.4[3] - x) / theta.4[4]))
##D 
##D #List of fixed parameters
##D theta.1 <- c(60, 0.56)
##D theta.2 <- c(60, 7 / 2250, 600)
##D theta.3 <- c(60, 294, 25)
##D theta.4.mean <- c(49.62, 290.51, 150, 45.51)
##D a <- 45
##D b <- 20
##D grid <- expand.grid(
##D         c(theta.4.mean[1] - b, theta.4.mean[1], theta.4.mean[1] + a), 
##D         c(theta.4.mean[2] - b, theta.4.mean[2], theta.4.mean[2] + a), 
##D         c(theta.4.mean[3] - b, theta.4.mean[3], theta.4.mean[3] + a), 
##D         c(theta.4.mean[4] - b, theta.4.mean[4], theta.4.mean[4] + a)  
##D         )
##D 
##D eta <- list()
##D eta <- c(eta, eta.1, eta.2, eta.3)
##D for(i in 1:length(grid[,1]))
##D     eta <- c(eta, eta.4)
##D 
##D theta.fix <- list(theta.1, theta.2, theta.3)
##D for(i in 1:length(grid[,1]))
##D     theta.fix[[length(theta.fix) + 1]] <- as.numeric(grid[i,])
##D 
##D density.on.grid <- rep(1,length(grid[,1]))
##D density.on.grid <- density.on.grid / sum(density.on.grid)
##D 
##D #Comparison table
##D p <- rep(0, length(eta))
##D p <- rbind(p, c(1, rep(0, length(eta) - 1)))
##D p <- rbind(p, c(1, 1, rep(0,length(eta) - 2)))
##D for(i in 1:length(grid[,1]))
##D     p <- rbind(p, c(rep(density.on.grid[i], 3), rep(0, length(eta) - 3)))
##D 
##D ### Case 1
##D 
##D #List of variances
##D sq.var.1 <- function(x, theta.1)
##D     1
##D     
##D sq.var.2 <- function(x, theta.2)
##D     1
##D 
##D sq.var.3 <- function(x, theta.3)
##D     1
##D 
##D sq.var.4 <- function(x, theta.4)
##D     1
##D 
##D sq.var <- list()
##D sq.var <- c(sq.var, sq.var.1, sq.var.2, sq.var.3)
##D for(i in 1:length(grid[,1]))
##D     sq.var <- c(sq.var, sq.var.4)
##D 
##D #Case 1, method 1
##D 
##D #Design estimation
##D res <- KLopt.lnorm(
##D     x = seq(0, 500, length.out = 10), 
##D     eta = eta, sq.var = sq.var, theta.fix = theta.fix, p = p, 
##D     opt = list(max.iter = 10)
##D )
##D plot(res)
##D summary(res)
##D 
##D #Case 1, method 2
##D 
##D #Design estimation
##D res <- KLopt.lnorm(
##D     x = seq(0, 500, length.out = 10), 
##D     eta = eta, sq.var = sq.var, theta.fix = theta.fix, p = p, 
##D     opt = list(
##D         method = 2, 
##D         max.iter = 10, 
##D         weights.evaluation.max.iter = 50, 
##D         support.epsilon = 1e-4
##D     )
##D )
##D plot(res)
##D summary(res)
##D 
##D ### Case 3
##D 
##D #List of variances
##D sq.var.1 <- function(x, theta.1)
##D     exp(1e-2 * eta.1(x,theta.1))
##D     
##D sq.var.2 <- function(x, theta.2)
##D     exp(1e-2 * eta.2(x,theta.2))
##D 
##D sq.var.3 <- function(x, theta.3)
##D     exp(1e-2 * eta.3(x,theta.3))
##D 
##D sq.var.4 <- function(x, theta.4)
##D     exp(1e-2 * eta.4(x,theta.4))
##D     
##D sq.var <- list()
##D sq.var <- c(sq.var, sq.var.1, sq.var.2, sq.var.3)
##D for(i in 1:length(grid[,1]))
##D     sq.var <- c(sq.var, sq.var.4)
##D 
##D #Case 3, method 1
##D     
##D #Design estimation
##D res <- KLopt.lnorm(
##D     x = seq(0, 500, length.out = 10), 
##D     eta = eta, sq.var = sq.var, theta.fix = theta.fix, p = p, 
##D     opt = list(max.iter = 10)
##D )
##D plot(res)
##D summary(res)
##D 
##D #Case 3, method 2
##D 
##D eta.2 <- function(x, theta.2)
##D     theta.2[1] + theta.2[2] * x - theta.2[3] * x * x
##D 
##D theta.2 <- c(60, 7 * 600 / 2250, 7 / 2250)
##D 
##D eta <- list()
##D eta <- c(eta, eta.1, eta.2, eta.3)
##D for(i in 1:length(grid[,1]))
##D     eta <- c(eta, eta.4)
##D 
##D theta.fix <- list(theta.1, theta.2, theta.3)
##D for(i in 1:length(grid[,1]))
##D     theta.fix[[length(theta.fix) + 1]] <- as.numeric(grid[i,])
##D 
##D #Design estimation
##D res <- KLopt.lnorm(
##D     x = seq(0, 500, length.out = 10), 
##D     eta = eta, sq.var = sq.var, theta.fix = theta.fix, p = p, 
##D     opt = list(max.iter = 6, method = 2)
##D )
##D plot(res)
##D summary(res)
## End(Not run)



