library(Umpire)
# set seed to ensure reproducibility
set.seed(463889)
# set up the parameters for the test
nGenes <- 20
mu <- rnorm(nGenes, 6, 1)
sigma <- 1/rgamma(nGenes, rate=14, shape=6)
# create an object that generates independent normal data
ind <- IndependentNormal(mu, sigma)
nrow(ind)
summary(ind)
# verify that the mean is correct
if(any(mu - ind@mu)) {
  print('means do not match')
} else {
  print('means verified')
}
# verify that the standard deviation is correct
if(any(sigma - ind@sigma)) {
  print('standard deviations do not match')
} else {
  print('sd verified')
}
# generate some random variables
x <- rand(ind, 3)
print(dim(x))
print(summary(x))
print(paste("'ind' should be valid:", validObject(ind)))
# break the validiity of the object
ind@sigma <- 1:3
try(
    print(paste("'ind' should not be valid:", validObject(ind, test=TRUE)))
    )
# cleanup
rm(nGenes, mu, sigma, ind, x)


