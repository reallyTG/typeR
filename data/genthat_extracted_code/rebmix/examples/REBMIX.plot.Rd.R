library(rebmix)


### Name: plot-methods
### Title: Plots RNGMIX, REBMIX, RCLRMIX and RCLSMIX Output
### Aliases: plot-methods plot,REBMIX,missing-method
###   plot,REBMVNORM,missing-method plot,RNGMIX,missing-method
###   plot,RNGMVNORM,missing-method plot,RCLRMIX,missing-method
###   plot,RCLRMVNORM,missing-method plot,RCLSMIX,missing-method
###   plot,RCLSMVNORM,missing-method
### Keywords: plot

### ** Examples

## Not run: 
##D devAskNewPage(ask = TRUE)
##D 
##D data("wine")
##D 
##D colnames(wine)
##D 
##D # Remove Cultivar column from wine dataset.
##D 
##D winecolnames <- !(colnames(wine) %in% "Cultivar")
##D 
##D wine <- wine[, winecolnames]
##D 
##D # Determine number of dimensions d and wine dataset size n.
##D 
##D d <- ncol(wine)
##D n <- nrow(wine)
##D 
##D # Estimate number of components, component weights and component parameters.
##D 
##D Sturges <- as.integer(1 + log2(n)) # Minimum v follows Sturges rule.
##D RootN <- as.integer(2 * n^0.5) # Maximum v follows RootN rule.
##D 
##D K <- c(floor(Sturges^(1/13)), ceiling(RootN^(1/13)))
##D 
##D wineest <- REBMIX(model = "REBMVNORM",
##D   Dataset = list(wine = wine),
##D   Preprocessing = "kernel density estimation",
##D   Criterion = "ICL-BIC",
##D   pdf = rep("normal", d),
##D   K = K[1]:K[2])
##D 
##D # Plot finite mixture.
##D 
##D plot(wineest, what = c("density", "IC", "logL", "D"),
##D   nrow = 2, ncol = 2, pty = "s")
## End(Not run)



