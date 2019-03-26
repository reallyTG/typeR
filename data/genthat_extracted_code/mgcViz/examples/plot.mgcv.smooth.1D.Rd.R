library(mgcViz)


### Name: plot.mgcv.smooth.1D
### Title: Plotting one dimensional smooth effects
### Aliases: plot.mgcv.smooth.1D plot.multi.mgcv.smooth.1D

### ** Examples

library(mgcViz)
n  <- 1e3
x1 <- rnorm(n)
x2 <- rnorm(n)
dat <- data.frame("x1" = x1, "x2" = x2,
                  "y" = sin(x1) + 0.5 * x2^2 + pmax(x2, 0.2) * rnorm(n))
b <- bamV(y ~ s(x1)+s(x2), data = dat, method = "fREML", aGam = list(discrete = TRUE))

o <- plot(sm(b, 1), nsim = 50) # 50 posterior simulations 

# Plot with fitted effect + posterior simulations + rug on x axis
( o <- o + l_simLine() + l_fitLine(colour = "red") + 
       l_rug(alpha = 0.8) )

## Not run: 
##D # Add CI lines at 1*sigma and 5*sigma
##D ( o <- o + l_ciLine(mul = 1) + l_ciLine(mul = 5, colour = "blue", linetype = 2) )
##D 
##D # Add partial residuals and change theme
##D ( o + l_points(shape = 19, size = 1, alpha = 0.2) + theme_classic() )
##D 
##D # Get second effect plot
##D o2 <- plot( sm(b, 2) )
##D 
##D # Plot it with polygon for partial residuals
##D o2 + l_ciPoly(mul = 5, fill = "light blue") + 
##D   l_fitLine(linetype = 2, colour = "red")
##D 
##D # Plot is with conditional density of partial residuals
##D o2 + l_dens(type = "cond", alpha = 0.9)  + 
##D   l_fitLine(linetype = 2, colour = "red")
##D   
##D ########
##D # Quantile GAM example
##D ########
##D # Fit model
##D b <- mqgamV(y ~ s(x1) + s(x2), qu = c(0.2, 0.5, 0.8), data = dat)
##D 
##D plot(sm(b, 1)) + l_fitLine(linetype = 2) + l_rug(colour = "blue")
## End(Not run)



