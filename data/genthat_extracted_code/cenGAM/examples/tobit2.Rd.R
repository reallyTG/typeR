library(cenGAM)


### Name: tobit2
### Title: Tobit II family for censored GAM
### Aliases: tobit2

### ** Examples

# Generate a small example
set.seed(1)
x <- matrix(2*rnorm(400), 200)
yn <-  x[,1]^2 + x[,2]
y <- yn + rnorm(200)
censored <- (rnorm(200) + 2*x[,2]+1) < 0 #censored according to x[,2]
ycensored <- replace(y, censored, 0) 
m <- gam(c(ycensored ~ s(x[,1]) + s(x[,2]) , ~x[,1]+x[,2], ~1,~1), 
family = tobit2(censoring = censored)) #estimated rho
par(mfrow = c(3,2))
plot(gam(y ~ s(x[,1]) + s(x[,2]) ), ylim=c(-5, 5), main = "True")
plot(m, ylim = c(-5, 5), main = "Tobit II estimated rho") 

summary(m) 
m$fitted #gives for each observation fitted mu1, mu2, sigma, rho

m2 <- gam(c(ycensored ~ s(x[,1]) + s(x[,2]) , ~x[,1]+x[,2], ~1), 
family = tobit2(censoring = censored, rho=0)) #non estimated rho
plot(m2, ylim = c(-5, 5), main = "Tobit II fixed rho") 

## Not run: 
##D #Larger example
##D set.seed(1)
##D x <- matrix(2*rnorm(1500), 500)
##D yn <- 2*x[,3] + 4*cos(x[,1]*2)
##D y <- yn + 3*rnorm(500)
##D censored <- (rnorm(500) + 2*x[,2]) < 0 #censored according to x[,2]
##D ycensored <- replace(y, censored, 0)  
##D 
##D par(mfrow = c(3,3))
##D 
##D # True model
##D plot(gam(y ~ s(x[,1]) + s(x[,2]) + s(x[, 3])), ylim=c(-5, 5), main = "True")
##D 
##D # Naive estimation
##D plot(gam(ycensored ~ s(x[,1]) + s(x[,2]) + s(x[, 3])), ylim=c(-5, 5), main = "Naive")
##D 
##D # Tobit II estimation
##D m <- gam(c(ycensored ~ s(x[,1]) + s(x[,2]) + s(x[, 3]), ~x[,1]+x[,2]+x[,3], ~1,~1), 
##D family = tobit2(censoring = censored))
##D plot(m, ylim = c(-5, 5), main = "Tobit II") 
##D 
##D #fitting with non-estimated rho
##D m2 <- gam(c(ycensored ~ s(x[,1]) + s(x[,2]) + s(x[, 3]), ~x[,1]+x[,2]+x[,3],~1), 
##D family = tobit2(censoring = censored, rho=0))
## End(Not run)



