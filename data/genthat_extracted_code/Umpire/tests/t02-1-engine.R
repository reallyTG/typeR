library(Umpire)
# set seed to ensure reproducibility
set.seed(328070)
# set the simulation parameters
nGenes <- 5
# this includes selecting all of the means and standard deviations
for (i in 1:4) {
  mu <- rnorm(nGenes, 6, 1)
  sigma <- 1/rgamma(nGenes, rate=14, shape=6)
  temp <- IndependentLogNormal(mu, sigma)
  assign(paste('ind', i, sep=''), temp, 1)
}
# now create a simulation engine
engine <- Engine(list(ind1, ind2, ind3, ind4))
summary(engine)
print(nrow(engine))
# generate data from the engine
x <- rand(engine, 1000)
rho <- cor(t(x))
summary(diag(rho))
summary(upper.tri(rho))
image(rho) # should be nearly diagonal
# cleanup
rm(ind1, ind2, ind3, ind4, mu, sigma, temp, i, engine, x, nGenes)


