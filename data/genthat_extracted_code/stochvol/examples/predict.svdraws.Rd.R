library(stochvol)


### Name: predict.svdraws
### Title: Prediction of Future Log-Volatilities
### Aliases: predict.svdraws
### Keywords: ts

### ** Examples

## Simulate a short and highly persistent SV process 
sim <- svsim(100, mu = -10, phi = 0.99, sigma = 0.2)

## Obtain 5000 draws from the sampler (that's not a lot)
draws <- svsample(sim$y, draws = 5000, burnin = 100,
		  priormu = c(-10, 1), priorphi = c(20, 1.5), priorsigma = 0.2)

## Predict 10 days ahead
fore <- predict(draws, 10)

## Check out the results
summary(fore)
plot(draws, forecast = fore)



