library(gmm)


### Name: gel
### Title: Generalized Empirical Likelihood estimation
### Aliases: gel evalGel

### ** Examples

# First, an exemple with the fonction g()

g <- function(tet, x)
	{
	n <- nrow(x)
	u <- (x[7:n] - tet[1] - tet[2]*x[6:(n-1)] - tet[3]*x[5:(n-2)])
	f <- cbind(u, u*x[4:(n-3)], u*x[3:(n-4)], u*x[2:(n-5)], u*x[1:(n-6)])
	return(f)
	}

Dg <- function(tet,x)
	{
	n <- nrow(x)
	xx <- cbind(rep(1, (n-6)), x[6:(n-1)], x[5:(n-2)])
        H  <- cbind(rep(1, (n-6)), x[4:(n-3)], x[3:(n-4)], x[2:(n-5)], x[1:(n-6)])
	f <- -crossprod(H, xx)/(n-6)
	return(f)
	}
n = 200
phi<-c(.2, .7)
thet <- 0.2
sd <- .2
set.seed(123)
x <- matrix(arima.sim(n = n, list(order = c(2, 0, 1), ar = phi, ma = thet, sd = sd)), ncol = 1)

res <- gel(g, x, c(0, .3, .6), grad = Dg)
summary(res)

# The same model but with g as a formula....  much simpler in that case

y <- x[7:n]
ym1 <- x[6:(n-1)]
ym2 <- x[5:(n-2)]

H <- cbind(x[4:(n-3)], x[3:(n-4)], x[2:(n-5)], x[1:(n-6)])
g <- y ~ ym1 + ym2
x <- H

res <- gel(g, x, c(0, .3, .6))
summary(res)

# Using evalGel to create the object without estimation

res <- evalGel(g, x, res$coefficients)




