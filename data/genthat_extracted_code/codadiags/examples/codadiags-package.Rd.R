library(codadiags)


### Name: codadiags-package
### Title: Markov chain Monte Carlo burn-in based on "bridge" statistics.
### Aliases: codadiags-package codadiags
### Keywords: Monte Carlo, initial transient, Brownian bridge, criticality,
###   neutronics

### ** Examples

require(codadiags)
set.seed(123)
x = AR1()
print(bridgestat.diag(x))
y = add.transient(x)
print(bridgestat.diag(y,trunc=10))



