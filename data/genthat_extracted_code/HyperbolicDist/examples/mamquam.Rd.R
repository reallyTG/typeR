library(HyperbolicDist)


### Name: mamquam
### Title: Size of Gravels from Mamquam River
### Aliases: mamquam
### Keywords: datasets

### ** Examples

data(mamquam)
str(mamquam)
attach(mamquam)
### Construct data from frequency summary, taking all observations
### at midpoints of intervals
psi <- rep(midpoints, counts)
barplot(table(psi))
### Fit the hyperbolic distribution
hyperbFit(psi)

### Actually hyperbFit can deal with frequency data
hyperbFit(midpoints, freq=counts)



