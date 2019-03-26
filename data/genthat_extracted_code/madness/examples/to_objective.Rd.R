library(madness)


### Name: to_objective
### Title: Convert a madness object into an objective value with gradient
### Aliases: to_objective

### ** Examples

# an objective function for matrix factorization with penalty:
fitfun <- function(R,L,Y,nu=-0.1) {
 dim(R) <- c(length(R),1)
Rmad <- madness(R)
dim(Rmad) <- c(ncol(L),ncol(Y))
Err <- Y - L %*% Rmad
penalty <- sum(exp(nu * Rmad))
fit <- norm(Err,'f') + penalty
to_objective(fit)
}
set.seed(1234)
L <- array(runif(30*5),dim=c(30,5)) 
Y <- array(runif(nrow(L)*20),dim=c(nrow(L),20))
R0 <- array(runif(ncol(L)*ncol(Y)),dim=c(ncol(L),ncol(Y)))
obj0 <- fitfun(R0,L,Y)
fooz <- nlm(fitfun, R0, L, Y, iterlim=3)



