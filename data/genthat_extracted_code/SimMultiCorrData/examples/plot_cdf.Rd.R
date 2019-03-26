library(SimMultiCorrData)


### Name: plot_cdf
### Title: Plot Theoretical Power Method Cumulative Distribution Function
###   for Continuous Variables
### Aliases: plot_cdf
### Keywords: Fleishman, Headrick cdf, plot, theoretical,

### ** Examples

## Not run: 
##D # Logistic Distribution: mean = 0, sigma = 1
##D 
##D # Find standardized cumulants
##D stcum <- calc_theory(Dist = "Logistic", params = c(0, 1))
##D 
##D # Find constants without the sixth cumulant correction
##D # (invalid power method pdf)
##D con1 <- find_constants(method = "Polynomial", skews = stcum[3],
##D                       skurts = stcum[4], fifths = stcum[5],
##D                       sixths = stcum[6], n = 25, seed = 1234)
##D 
##D # Plot cdf with cumulative probability calculated up to delta = 5
##D plot_cdf(c = con1$constants, method = "Polynomial",
##D          title = "Invalid Logistic CDF", calc_cprob = TRUE, delta = 5)
##D 
##D # Find constants with the sixth cumulant correction
##D # (valid power method pdf)
##D con2 <- find_constants(method = "Polynomial", skews = stcum[3],
##D                       skurts = stcum[4], fifths = stcum[5],
##D                       sixths = stcum[6], Six = seq(1.5, 2, 0.05))
##D 
##D # Plot cdf with cumulative probability calculated up to delta = 5
##D plot_cdf(c = con2$constants, method = "Polynomial",
##D          title = "Valid Logistic CDF", calc_cprob = TRUE, delta = 5)
## End(Not run)




