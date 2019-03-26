library(ahnr)


### Name: visualize
### Title: Visualize Artificial Hydrocarbon Network
### Aliases: visualize

### ** Examples

## Not run: 
##D # Create data
##D x <- 2 * runif(1000) - 1;
##D x <- sort(x)
##D 
##D y <- (x < 0.1) * (0.05 * runif(100) + atan(pi*x)) +
##D     (x >= 0.1 & x < 0.6) * (0.05 * runif(1000) + sin(pi*x)) +
##D     (x >= 0.6) * (0.05 * runif(1000) + cos(pi*x))
##D 
##D # Create Sigma list
##D Sigma <- list(X = data.frame(x = x), Y = data.frame(y = y))
##D 
##D # Train AHN
##D ahn <- fit(Sigma, 5, 0.01, 500)
##D 
##D # Visualize AHN
##D visualize(ahn)
## End(Not run)




