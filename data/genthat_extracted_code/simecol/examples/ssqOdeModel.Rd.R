library(simecol)


### Name: ssqOdeModel
### Title: Sum of Squares Between odeModel and Data
### Aliases: ssqOdeModel
### Keywords: misc

### ** Examples

data(chemostat)
cs1 <- chemostat

## generate some noisy data
parms(cs1)[c("vm", "km")] <- c(2, 10)
times(cs1) <- c(from = 0, to = 20, by = 2)
yobs <- out(sim(cs1))
obstime <- yobs$time
yobs$time <- NULL
yobs$S <- yobs$S + rnorm(yobs$S, sd = 0.1 * sd(yobs$S))*2
yobs$X <- yobs$X + rnorm(yobs$X, sd = 0.1 * sd(yobs$X))

## SSQ between model and data
ssqOdeModel(NULL, cs1, obstime, yobs)

## SSQ between model and data, different parameter set
ssqOdeModel(p=c(vm=1, km=2), cs1, obstime, yobs)

## SSQ between model and data, downweight second observation
## (both variables)
weights <- data.frame(X=rep(1, nrow(yobs)), S = rep(1, nrow=(yobs)))
ssqOdeModel(p=c(vm=1, km=2), cs1, obstime, yobs, weights=weights)

## downweight 3rd data set (row)
weights[3,] <- 0.1
ssqOdeModel(p=c(vm=1, km=2), cs1, obstime, yobs, weights=weights)

## give one value double weight (e.g. 4th value of S)
weights$S[4] <- 2
ssqOdeModel(p=c(vm=1, km=2), cs1, obstime, yobs, weights=weights)




