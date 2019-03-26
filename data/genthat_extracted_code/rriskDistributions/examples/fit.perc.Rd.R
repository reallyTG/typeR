library(rriskDistributions)


### Name: fit.perc
### Title: Choosing distribution by given quantiles
### Aliases: fit.perc
### Keywords: gui

### ** Examples

## Not run: 
##D     chosenDistr1 <- fit.perc()
##D     chosenDistr1
##D     
##D     chosenDistr2 <- fit.perc(tolPlot = 5)
##D     chosenDistr2
##D     
##D     chosenDistr3 <- fit.perc(p = c(0.3, 0.8, 0.9), q = c(10, 20, 40))
##D     chosenDistr3
##D     
##D     chosenDistr4 <- fit.perc(p = c(0.3, 0.8, 0.9), q = c(10, 30, 40))
##D     chosenDistr4
##D     
##D     chosenDistr5 <- fit.perc(p = c(0.3, 0.8, 0.9), q = c(10, 30, 40), tolPlot = 10)
##D     chosenDistr5
##D 
##D     ## Fitting a PERT distribution
##D     p <- c(0.025, 0.5, 0.6, 0.975)
##D     q <- round(mc2d::qpert(p = p, min = 0, mode = 3, max = 10, shape = 5), digits = 2)
##D     chosenDistr6 <- fit.perc(p = p, q = q, tolPlot = 10)
##D     chosenDistr6
## End(Not run)



