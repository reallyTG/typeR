library(heatmaply)


### Name: normalize
### Title: Normalization transformation (0-1)
### Aliases: normalize normalize.default normalize.data.frame
###   normalize.matrix

### ** Examples

## Not run: 
##D x <- mtcars
##D x <- data.frame(x)
##D x$am <- factor(x$am)
##D x$vs <- factor(x$vs)
##D heatmaply(percentize(x))
##D heatmaply(normalize(x))
##D 
##D 
##D x <- data.frame(a = 1:10, b = 11:20)
##D x[4:6, 1:2] <- NA
##D normalize(x)
##D normalize(x[,1])
##D 
## End(Not run)



