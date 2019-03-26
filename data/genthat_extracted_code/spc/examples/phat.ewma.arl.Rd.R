library(spc)


### Name: phat.ewma.arl
### Title: Compute ARLs of EWMA phat control charts
### Aliases: phat.ewma.arl phat.ewma.crit phat.ewma.lambda
### Keywords: ts

### ** Examples

## Simple example to demonstrate the chart.

# some functions
h.mu <- function(mu) pnorm(LSL-mu) + pnorm(mu-USL)
ewma <- function(x, lambda=0.1, z0=0) filter(lambda*x, 1-lambda, m="r", init=z0)

# parameters
LSL <- -3       # lower specification limit
USL <-  3	# upper specification limit
n <- 5		# batch size
lambda <- 0.1	# EWMA smoothing parameter
L0 <- 1000	# in-control Average Run Length (ARL)
z0 <- h.mu(0)	# start at minimal defect level
ucl <- phat.ewma.crit(lambda, L0, 0, n, z0, LSL=LSL, USL=USL)

# data
x0 <- matrix(rnorm(50*n), ncol=5)	# in-control data
x1 <- matrix(rnorm(50*n, mean=0.5), ncol=5)# out-of-control data
x <- rbind(x0,x1)			# all data

# create chart
xbar <- apply(x, 1, mean)
phat <- h.mu(xbar)
z <- ewma(phat, lambda=lambda, z0=z0)
plot(1:length(z), z, type="l", xlab="batch", ylim=c(0,.02))
abline(h=z0, col="grey", lwd=.7)
abline(h=ucl, col="red")


## S. Knoth, S. Steinmetz (2013)

# Table 1

lambdas <- c(.5, .25, .2, .1)
L0 <- 370.4
n <- 5
LSL <- -3
USL <- 3

phat.ewma.CRIT <- Vectorize("phat.ewma.crit", "lambda")
p.star <- pnorm( LSL ) + pnorm( -USL ) ## lower bound of the chart
ucls <- phat.ewma.CRIT(lambdas, L0, 0, n, p.star, LSL=LSL, USL=USL)
print(cbind(lambdas, ucls))

# Table 2

mus <- c((0:4)/4, 1.5, 2, 3)
phat.ewma.ARL <- Vectorize("phat.ewma.arl", "mu")
arls <- NULL
for ( i in 1:length(lambdas) ) {
  arls <- cbind(arls, round(phat.ewma.ARL(lambdas[i], ucls[i], mus,
                n, p.star, LSL=LSL, USL=USL), digits=2))
}
arls <- data.frame(arls, row.names=NULL)
names(arls) <- lambdas
print(arls)

# Table 3

## Not run: 
##D mus <- c(.25, .5, 1, 2)
##D phat.ewma.LAMBDA <- Vectorize("phat.ewma.lambda", "mu")
##D lambdas <- phat.ewma.LAMBDA(L0, mus, n, p.star, LSL=LSL, USL=USL)
##D print(cbind(mus, lambdas))
## End(Not run)



