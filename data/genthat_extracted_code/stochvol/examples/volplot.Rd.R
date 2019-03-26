library(stochvol)


### Name: volplot
### Title: Plotting Quantiles of the Latent Volatilities
### Aliases: volplot
### Keywords: hplot ts

### ** Examples

## Simulate a short and highly persistent SV process 
sim <- svsim(100, mu = -10, phi = 0.99, sigma = 0.2)

## Obtain 5000 draws from the sampler (that's not a lot)
draws <- svsample(sim$y, draws = 5000, burnin = 100,
		  priormu = c(-10, 1), priorphi = c(20, 1.5),
		  priorsigma = 0.2)

## Plot the latent volatilities and some forecasts
volplot(draws, forecast = 10)

## Re-plot with different quantiles
newquants <- c(0.01, 0.05, 0.25, 0.5, 0.75, 0.95, 0.99)
draws <- updatesummary(draws, quantiles=newquants)

volplot(draws, forecast = 10)



