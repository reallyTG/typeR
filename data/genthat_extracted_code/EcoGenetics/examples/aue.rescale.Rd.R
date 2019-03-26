library(EcoGenetics)


### Name: aue.rescale
### Title: Scaling a data frame or matrix to [0, 1] or [-1, 1] ranges
### Aliases: aue.rescale

### ** Examples


## Not run: 
##D 
##D data(eco.test)
##D require(adegenet)
##D pc <- dudi.pca(eco[["P"]], scannf = FALSE, nf = 3)
##D pc <- pc$li
##D pc <- aue.rescale(pc)
##D plot(eco[["XY"]][, 1], eco[["XY"]][, 2], col = rgb(pc), pch = 16, 
##D cex = 1.5, xlab ="X", ylab= "Y")
##D 
## End(Not run)




