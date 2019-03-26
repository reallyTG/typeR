library(heatmaply)


### Name: percentize
### Title: Empirical Percentile Transformation
### Aliases: percentize percentize.default percentize.data.frame
###   percentize.matrix

### ** Examples

## Not run: 
##D x <- mtcars
##D x <- data.frame(x)
##D x$am <- factor(x$am)
##D x$vs <- factor(x$vs)
##D heatmaply(percentize(x))
##D 
##D 
##D x <- data.frame(a = 1:10, b = 11:20)
##D x[4:6, 1:2] <- NA
##D percentize(x)
##D percentize(x[,1])
##D 
## End(Not run)



