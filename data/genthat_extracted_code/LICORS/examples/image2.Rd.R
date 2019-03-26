library(LICORS)


### Name: image2
### Title: Improved image() function
### Aliases: image2 make_legend
### Keywords: aplot color hplot

### ** Examples

## Not run: 
##D # Correlation matrix
##D data(iris)  # make sure its from 'datasets' package, not from 'locfit'
##D image(cor(as.matrix(iris[, names(iris) != "Species"])))
##D 
##D # Correlation matrix has diagonal from top left to bottom right
##D par(mar = c(1, 3, 1, 2))
##D image2(cor(as.matrix(iris[, names(iris) != "Species"])), col = "RdBu", axes = FALSE)
## End(Not run)
# Color histogram
nn <- 10
set.seed(nn)
AA <- matrix(sample(c(rnorm(nn^2, -1, 0.1), rexp(nn^2/2, 0.5))), ncol = nn)

image2(AA, col = "Spectral")
image2(y = 1:15 + 2, x = 1:10, AA, col = "Spectral", axes = TRUE)
image2(y = 1:15 + 2, x = 1:10, AA, col = "Spectral", density = TRUE, axes = TRUE)

image2(AA, col = "Spectral", density = TRUE, zlim = c(min(AA), 3))



