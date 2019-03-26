library(gmm)


### Name: getLamb
### Title: Solving for the Lagrange multipliers of Generalized Empirical
###   Likelihood (GEL)
### Aliases: getLamb

### ** Examples

g <- function(tet,x)
	{
	n <- nrow(x)
	u <- (x[7:n] - tet[1] - tet[2]*x[6:(n-1)] - tet[3]*x[5:(n-2)])
	f <- cbind(u, u*x[4:(n-3)], u*x[3:(n-4)], u*x[2:(n-5)], u*x[1:(n-6)])
	return(f)
	}
n = 500
phi<-c(.2, .7)
thet <- 0.2
sd <- .2
x <- matrix(arima.sim(n = n, list(order = c(2, 0, 1), ar = phi, ma = thet, sd = sd)), ncol = 1)
gt <- g(c(0,phi),x)
getLamb(gt, type = "EL",method="optim")



