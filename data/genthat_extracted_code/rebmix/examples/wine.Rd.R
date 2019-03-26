library(rebmix)


### Name: wine
### Title: Wine Recognition Data
### Aliases: wine
### Keywords: datasets

### ** Examples

## Not run: 
##D devAskNewPage(ask = TRUE)
##D 
##D data("wine")
##D 
##D # Show level attributes.
##D 
##D levels(factor(wine[["Cultivar"]]))
##D 
##D # Split dataset into train (75##D 
##D 
##D set.seed(3)
##D 
##D Wine <- split(p = 0.75, Dataset = wine, class = 14)
##D 
##D # Estimate number of components, component weights and component
##D # parameters for train subsets.
##D 
##D n <- range(a.ntrain(Wine))
##D 
##D K <- c(as.integer(1 + log2(n[1])), # Minimum v follows Sturges rule.
##D   as.integer(10 * log10(n[2]))) # Maximum v follows log10 rule.
##D 
##D K <- c(floor(K[1]^(1/13)), ceiling(K[2]^(1/13)))
##D 
##D wineest <- REBMIX(model = "REBMVNORM",
##D   Dataset = a.train(Wine),
##D   Preprocessing = "kernel density estimation",
##D   cmax = 10,
##D   Criterion = "ICL-BIC",
##D   pdf = rep("normal", 13),
##D   K = K[1]:K[2],
##D   Restraints = "loose")
##D 
##D plot(wineest, pos = 1, nrow = 7, ncol = 6, what = c("den"))
##D plot(wineest, pos = 2, nrow = 7, ncol = 6, what = c("den"))
##D plot(wineest, pos = 3, nrow = 7, ncol = 6, what = c("den"))
##D 
##D # Selected chunks.
##D 
##D winecla <- RCLSMIX(model = "RCLSMVNORM",
##D   x = list(wineest),
##D   Dataset = a.test(Wine),
##D   Zt = a.Zt(Wine))
##D 
##D winecla
##D 
##D summary(winecla)
##D 
##D # Plot selected chunks.
##D 
##D plot(winecla, nrow = 7, ncol = 6)
## End(Not run)



