library(fBasics)


### Name: maxdd
### Title: Drawdown Statistics
### Aliases: maxdd dmaxdd pmaxdd rmaxdd maxddStats
### Keywords: distribution

### ** Examples

## rmaxdd -
   # Set a random seed
   set.seed(1953)               
   # horizon of the investor, time T
   horizon = 1000               
   # number of MC samples, N -> infinity
   samples = 1000               
   # Range of expected Drawdons
   xlim = c(0, 5)*sqrt(horizon) 
   # Plot Histogram of Simulated Max Drawdowns:
   r = rmaxdd(n = samples, mean = 0, sd = 1, horizon = horizon)
   hist(x = r, n = 40, probability = TRUE, xlim = xlim, 
     col = "steelblue4", border = "white", main = "Max. Drawdown Density") 
   points(r, rep(0, samples), pch = 20, col = "orange", cex = 0.7)
   
## dmaxdd - 
   x = seq(0, xlim[2], length = 200)
   d = dmaxdd(x = x, sd = 1, horizon = horizon, N = 1000)
   lines(x, d, lwd = 2)
    
## pmaxdd -
   # Count Frequencies of Drawdowns Greater or Equal to "h":
   n = 50
   x = seq(0, xlim[2], length = n)
   g = rep(0, times = n)
   for (i in 1:n) g[i] = length (r[r > x[i]]) / samples
   plot(x, g, type ="h", lwd = 3,
     xlab = "q", main = "Max. Drawdown Probability")
   # Compare with True Probability "G_D(h)":
   x = seq(0, xlim[2], length = 5*n)
   p = pmaxdd(q = x, sd = 1, horizon = horizon, N = 5000)
   lines(x, p, lwd = 2, col="steelblue4") 
   
## maxddStats -
   # Compute expectation Value E[D]:
   maxddStats(mean = -0.5, sd = 1, horizon = 10^(1:4))
   maxddStats(mean =  0.0, sd = 1, horizon = 10^(1:4))
   maxddStats(mean =  0.5, sd = 1, horizon = 10^(1:4))



