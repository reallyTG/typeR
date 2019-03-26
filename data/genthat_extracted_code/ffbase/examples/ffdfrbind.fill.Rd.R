library(ffbase)


### Name: ffdfrbind.fill
### Title: rbind for ffdf where missing columns are added if not available
###   in one of the ffdf objects
### Aliases: ffdfrbind.fill

### ** Examples

x <- ffdfrbind.fill( as.ffdf(iris), 
                     as.ffdf(iris[, c("Sepal.Length", "Sepal.Width"
                                     , "Petal.Length")]))
class(x)
nrow(x)
sum(is.na(x$Petal.Width))






