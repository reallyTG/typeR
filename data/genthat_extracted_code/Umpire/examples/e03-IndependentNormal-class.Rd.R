library(Umpire)


### Name: IndependentNormal-class
### Title: The "IndependentNormal" Class
### Aliases: IndependentNormal-class IndependentNormal
###   alterMean,IndependentNormal-method alterSD,IndependentNormal-method
###   nrow,IndependentNormal-method rand,IndependentNormal-method
###   summary,IndependentNormal-method
### Keywords: datagen classes distribution

### ** Examples

showClass("IndependentNormal")
nGenes <- 20
mu <- rnorm(nGenes, 6, 1)
sigma <- 1/rgamma(nGenes, rate=14, shape=6)
ind <- IndependentNormal(mu, sigma)
nrow(ind)
summary(ind)
if (any(mu - ind@mu)) {
  print('means do not match')
} else {
  print('means verified')
}
if (any(sigma - ind@sigma)) {
  print('standard deviations do not match')
} else {
  print('sd verified')
}
x <- rand(ind, 3)
print(dim(x))
print(summary(x))
print(paste("'ind' should be valid:", validObject(ind)))
ind@sigma <- 1:3 # now we break it
print(paste("'ind' should not be valid:", validObject(ind, test=TRUE)))
rm(nGenes, mu, sigma, ind, x)



