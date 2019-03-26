library(RegularizedSCA)


### Name: pca_gca
### Title: PCA-GCA method for selecting the number of common and
###   distinctive components.
### Aliases: pca_gca

### ** Examples

## Not run: 
##D DATA1 <- matrix(rnorm(50), nrow=5)
##D DATA2 <- matrix(rnorm(100), nrow=5)
##D DATA <- cbind(DATA1, DATA2)
##D R <- 5
##D Jk <- c(10, 20) 
##D pca_gca(DATA, Jk, cor_min = .8)
## End(Not run)



