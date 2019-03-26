library(discreteRV)


### Name: rsim
### Title: Simulate n independent trials from a random variable X:
### Aliases: rsim

### ** Examples

X.Bern <- RV(c(1,0), c(.5,.5))
X.Bern.sim100 <- rsim(X.Bern, 100)

X.loaded.die <- RV(1:6, odds = c(1,1,1,1,2,4))
X.loaded.die.sim100 <- rsim(X.loaded.die, 100)

# The function 'rsim()' attaches the probabilities as names to the random draws.
# To get the values only, use 'as.vector()':
as.vector(X.Bern.sim100)
as.vector(X.loaded.die.sim100)



