library(biganalytics)


### Name: bigglm.big.matrix
### Title: Use Thomas Lumley's "biglm" package with a "big.matrix"
### Aliases: bigglm.big.matrix biglm.big.matrix

### ** Examples

## Not run: 
##D library(bigmemory)
##D x <- matrix(unlist(iris), ncol=5)
##D colnames(x) <- names(iris)
##D x <- as.big.matrix(x)
##D head(x)
##D 
##D silly.biglm <- biglm.big.matrix(Sepal.Length ~ Sepal.Width + Species,
##D                                 data=x, fc="Species")
##D summary(silly.biglm)
##D 
##D y <- data.frame(x[,])
##D y$Species <- as.factor(y$Species)
##D head(y)
##D 
##D silly.lm <- lm(Sepal.Length ~ Sepal.Width + Species, data=y)
##D summary(silly.lm)
## End(Not run)



