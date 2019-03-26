library(fExtremes)


### Name: GpdDistribution
### Title: Generalized Pareto Distribution
### Aliases: GpdDistribution dgpd pgpd qgpd rgpd gpdMoments gpdSlider
### Keywords: distribution

### ** Examples

## rgpd  -
   par(mfrow = c(2, 2), cex = 0.7)
   r = rgpd(n = 1000, xi = 1/4)
   plot(r, type = "l", col = "steelblue", main = "GPD Series")
   grid()
   
## dgpd -
   # Plot empirical density and compare with true density:
   # Omit values greater than 500 from plot
   hist(r, n = 50, probability = TRUE, xlab = "r", 
     col = "steelblue", border = "white",
     xlim = c(-1, 5), ylim = c(0, 1.1), main = "Density")
   box()
   x = seq(-5, 5, by = 0.01)
   lines(x, dgpd(x, xi = 1/4), col = "orange")
   
## pgpd -
   # Plot df and compare with true df:
   plot(sort(r), (1:length(r)/length(r)), 
     xlim = c(-3, 6), ylim = c(0, 1.1), pch = 19, 
     cex = 0.5, ylab = "p", xlab = "q", main = "Probability")
   grid()
   q = seq(-5, 5, by = 0.1)
   lines(q, pgpd(q, xi = 1/4), col = "steelblue")
   
## qgpd -
   # Compute quantiles, a test:
   qgpd(pgpd(seq(-1, 5, 0.25), xi = 1/4 ), xi = 1/4) 



