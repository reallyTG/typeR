library(Umpire)
# set seed to ensure reproducbility
set.seed(145753)
# set up the noise model
noise <- NoiseModel(0, 50, 0.1)
# set up some independent normal components
nGenes <- 5
for (i in 1:2) {
  mu <- rnorm(nGenes, 6, 1)
  sigma <- 1/rgamma(nGenes, shape=14, rate=5)
  temp <- IndependentNormal(mu, sigma)
  assign(paste('ind', i, sep=''), temp, 1)
}
# now create a multivariate normal component
a <- runif(1)
b <- sqrt(1-a^2)
X <- matrix(c(a, b, -b, a), 2, 2)
Lambda2 <- diag(rev(sort(rexp(2))), 2)
Y <- t(X) %*% Lambda2 %*% X
marvin <- MVN(c(0,0), Y)
# Now create the engine
#old: engine <- EngineWithActivity(active=0.8, ind1, ind2, marvin)
engine <- EngineWithActivity(active=0.8, list(ind1, ind2, marvin))
# generate some data
x <- rand(engine, 10)
# add noise
y <- blur(noise, x)
print(summary(as.vector(x-y)))
# cleanup
rm(ind1, ind2, mu, sigma, temp, i, nGenes,
   a, b, Lambda2, X, Y, marvin, engine,
   x, y, noise)



