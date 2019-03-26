library(discreteRV)


### Name: RV
### Title: Make a random variable consisting of possible outcome values and
###   their probabilities or odds
### Aliases: RV RV-package

### ** Examples

# Make a 50:50 Bernoulli random variable:
X.Bern <- RV(c(1,0), c(.5,.5))

# An equivalent method
X.Bern <- RV("bernoulli")

# Make a fair coin flip game with payoffs +$1 and -$1:
X.fair.coin <- RV(c(1,-1), c(.5,.5))

# Make a biased coin flip game with odds 1:2 and with fair payoffs +$2 and -$1
X.biased.coin <- RV(c(2,-1), odds = c(1,2))

# Make a fair die
X.fair.die <- RV(1:6, 1/6)

# Make a loaded die, specifying odds 1:1:1:1:2:4 rather than probabilities:
X.loaded.die <- RV(1:6, odds = c(1,1,1,1,2,4))

# Make a Poisson random variable
pois.func <- function(x, lambda) { lambda^x * exp(-lambda) / factorial(x) }
X.pois <- RV(c(0, Inf), pois.func, lambda = 5)

# An equivalent method
X.pois <- RV("poisson")



