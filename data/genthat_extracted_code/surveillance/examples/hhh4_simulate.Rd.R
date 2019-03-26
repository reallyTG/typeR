library(surveillance)


### Name: hhh4_simulate
### Title: Simulate '"hhh4"' Count Time Series
### Aliases: simulate.hhh4
### Keywords: datagen

### ** Examples

data(influMen)
# convert to sts class and extract meningococcal disease time series
meningo <- disProg2sts(influMen)[,2]

# fit model
fit <- hhh4(meningo, control = list(ar = list(f = ~ 1),
            end = list(f = addSeason2formula(S = 1, period = 52)),
            family = "NegBin1"))
plot(fit)

# simulate from model
simData <- simulate(fit, seed=1234)

# plot simulated data
plot(simData, main = "simulated data", xaxis.labelFormat=NULL)

# consider a Poisson instead of a NegBin model
coefs <- coef(fit)
coefs["overdisp"] <- 0

simData2 <- simulate(fit, seed=123, coefs = coefs)
plot(simData2, main = "simulated data: Poisson model", xaxis.labelFormat = NULL)

# consider a model with higher autoregressive parameter
coefs <- coef(fit)
coefs[1] <- log(0.5)

simData3 <- simulate(fit, seed=321, coefs = coefs)
plot(simData3, main = "simulated data: lambda = 0.5", xaxis.labelFormat = NULL)



