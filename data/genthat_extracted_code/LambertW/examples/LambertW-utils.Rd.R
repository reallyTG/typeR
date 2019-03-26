library(LambertW)


### Name: LambertW-utils
### Title: Utilities for Lambert W \times F Random Variables
### Aliases: LambertW-utils dLambertW mLambertW pLambertW qLambertW
###   qqLambertW rLambertW
### Keywords: datagen distribution univar

### ** Examples


###############################
######### mLambertW ###########
mLambertW(theta = list(beta = c(0, 1), gamma = 0.1))
mLambertW(theta = list(beta = c(1, 1), gamma = 0.1)) # mean shifted by 1
mLambertW(theta = list(beta = c(0, 1), gamma = 0)) # N(0, 1)

###############################
######### rLambertW ###########
set.seed(1)
# same as rnorm(1000)
x <- rLambertW(n=100, theta = list(beta=c(0, 1)), distname = "normal") 
skewness(x) # very small skewness
medcouple_estimator(x) # also close to zero

y <- rLambertW(n=100, theta = list(beta = c(1, 3), gamma = 0.1), 
               distname = "normal")
skewness(y) # high positive skewness (in theory equal to 3.70)
medcouple_estimator(y) # also the robust measure gives a high value

op <- par(no.readonly=TRUE)
par(mfrow = c(2, 2), mar = c(2, 4, 3, 1))
plot(x)
hist(x, prob=TRUE, 15)
lines(density(x))

plot(y)
hist(y, prob=TRUE, 15)
lines(density(y))
par(op)
###############################
######### dLambertW ###########
beta.s <- c(0, 1)
gamma.s <- 0.1

# x11(width=10, height=5)
par(mfrow = c(1, 2), mar = c(3, 3, 3, 1))
curve(dLambertW(x, theta = list(beta = beta.s, gamma = gamma.s), 
                distname = "normal"),
     -3.5, 5, ylab = "",  main="Density function")
plot(dnorm, -3.5, 5, add = TRUE, lty = 2)
legend("topright" , c("Lambert W x Gaussian" , "Gaussian"), lty = 1:2)
abline(h=0)

###############################
######### pLambertW ###########

curve(pLambertW(x, theta = list(beta = beta.s, gamma = gamma.s),
                distname = "normal"),
      -3.5, 3.5, ylab = "", main = "Distribution function")
plot(pnorm, -3.5,3.5, add = TRUE, lty = 2)
legend("topleft" , c("Lambert W x Gaussian" , "Gaussian"), lty = 1:2)
par(op)

######## Animation 
## Not run: 
##D gamma.v <- seq(-0.15, 0.15, length = 31) # typical, empirical range of gamma
##D b <- get_support(gamma_01(min(gamma.v)))[2]*1.1
##D a <- get_support(gamma_01(max(gamma.v)))[1]*1.1
##D 
##D for (ii in seq_along(gamma.v)) {
##D   curve(dLambertW(x, beta = gamma_01(gamma.v[ii])[c("mu_x", "sigma_x")], 
##D                   gamma = gamma.v[ii], distname="normal"),
##D         a, b, ylab="", lty = 2, col = 2, lwd = 2, main = "pdf", 
##D         ylim = c(0, 0.45))
##D   plot(dnorm, a, b, add = TRUE, lty = 1, lwd = 2)
##D   legend("topright" , c("Lambert W x Gaussian" , "Gaussian"), 
##D          lty = 2:1, lwd = 2, col = 2:1)
##D   abline(h=0)
##D   legend("topleft", cex = 1.3, 
##D          c(as.expression(bquote(gamma == .(round(gamma.v[ii],3))))))
##D Sys.sleep(0.04)
##D }
## End(Not run)

###############################
######### qLambertW ###########

p.v <- c(0.01, 0.05, 0.5, 0.9, 0.95,0.99)
qnorm(p.v)
# same as above except for rounding errors
qLambertW(p.v, theta = list(beta = c(0, 1), gamma = 0), distname = "normal") 
# positively skewed data -> quantiles are higher
qLambertW(p.v, theta = list(beta = c(0, 1), gamma = 0.1),
          distname = "normal")

###############################
######### qqLambertW ##########
## Not run: 
##D y <- rLambertW(n=500, distname="normal", 
##D                theta = list(beta = c(0,1), gamma = 0.1))
##D 
##D layout(matrix(1:2, ncol = 2))
##D qqnorm(y)
##D qqline(y)
##D qqLambertW(y, theta = list(beta = c(0, 1), gamma = 0.1), 
##D            distname = "normal") 
## End(Not run)



