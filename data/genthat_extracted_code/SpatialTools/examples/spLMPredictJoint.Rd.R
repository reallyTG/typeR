library(SpatialTools)


### Name: spLMPredictJoint
### Title: Returns posterior predictive sample from spLM object
### Aliases: spLMPredictJoint
### Keywords: bayesian joint prediction

### ** Examples

# Set parameters
n <- 100
np <- 12
n.samples <- 10
burnin.start <- .5 * n.samples + 1
sigmasq <- 1
tausq <- 0.0
phi <- 1
cov.model <- "exponential"
n.report <- 5

# Generate coordinates
coords <- matrix(runif(2 * n), ncol = 2); 
pcoords <- as.matrix(expand.grid(seq(0, 1, len = 12), seq(0, 1, len = 12)))
  
# Construct design matrices
X <- as.matrix(cbind(1, coords))
Xp <- cbind(1, pcoords)

# Specify priors
starting <- list("phi" = phi, "sigma.sq"= sigmasq, "tau.sq" = tausq)
tuning <- list("phi"=0.1, "sigma.sq"=0.1, "tau.sq"=0.1)
priors.1 <- list("beta.Norm"=list(c(1, 2, 1), diag(100, 3)),
                     "phi.Unif"=c(0.00001, 10), "sigma.sq.IG"=c(1, 1))

# Generate data
B <- rnorm(3, c(1, 2, 1), sd = 10)
phi <- runif(1, 0, 10)
sigmasq <- 1/rgamma(1, 1, 1)
V <- simple.cov.sp(D = dist1(coords), cov.model, c(sigmasq, 1/phi), error.var = tausq, 
	smoothness = nu, finescale.var = 0)
y <- X %*% B + rmvnorm(1, rep(0, n), V) + rnorm(n, 0, sqrt(tausq))

# Create spLM object
library(spBayes)
m1 <- spBayes::spLM(y ~ X - 1, coords = coords, starting = starting,
	tuning = tuning, priors = priors.1, cov.model = cov.model,
	n.samples = n.samples, verbose = FALSE, n.report = n.report)

# Sample from joint posterior predictive distribution
y1 <- spLMPredictJoint(m1, pred.coords = pcoords, pred.covars = Xp, 
	start = burnin.start, verbose = FALSE, method = "chol")



