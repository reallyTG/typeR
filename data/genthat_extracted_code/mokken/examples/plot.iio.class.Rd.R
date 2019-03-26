library(mokken)


### Name: plot.iio.class
### Title: Plot iio.class objects
### Aliases: plot.iio.class
### Keywords: plot iio

### ** Examples

data(acl)
Communality <- acl[,1:10]
iio.list <- check.iio(Communality)
summary(iio.list)
plot(iio.list)



