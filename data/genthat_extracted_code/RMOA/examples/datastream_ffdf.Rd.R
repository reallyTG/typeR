library(RMOA)


### Name: datastream_ffdf
### Title: data streams on an ffdf
### Aliases: datastream_ffdf

### ** Examples

## You need to load package ff before you can use datastream_ffdf
require(ff)
irisff <- as.ffdf(factorise(iris))
x <- datastream_ffdf(data=irisff)
x$get_points(10)
x
x$get_points(10)
x



