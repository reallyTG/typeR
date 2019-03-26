library(fExtremes)


### Name: GevDistribution
### Title: Generalized Extreme Value Distribution
### Aliases: GevDistribution dgev pgev qgev rgev gevMoments gevSlider
### Keywords: models

### ** Examples

## rgev -
   # Create and plot 1000 Weibull distributed rdv:
   r = rgev(n = 1000, xi = -1)
   plot(r, type = "l", col = "steelblue", main = "Weibull Series")
   grid()
   
## dgev - 
   # Plot empirical density and compare with true density:
   hist(r[abs(r)<10], nclass = 25, freq = FALSE, xlab = "r", 
     xlim = c(-5,5), ylim = c(0,1.1), main = "Density")
   box()
   x = seq(-5, 5, by = 0.01)
   lines(x, dgev(x, xi = -1), col = "steelblue")
   
## pgev -
   # Plot df and compare with true df:
   plot(sort(r), (1:length(r)/length(r)), 
     xlim = c(-3, 6), ylim = c(0, 1.1),
     cex = 0.5, ylab = "p", xlab = "q", main = "Probability")
   grid()
   q = seq(-5, 5, by = 0.1)
   lines(q, pgev(q, xi = -1), col = "steelblue")
 
## qgev -   
   # Compute quantiles, a test:
   qgev(pgev(seq(-5, 5, 0.25), xi = -1), xi = -1)   

## gevMoments:
   # Returns true mean and variance:
   gevMoments(xi = 0, mu = 0, beta = 1)
   
## Slider:
   # gevSlider(method = "dist")
   # gevSlider(method = "rvs")



