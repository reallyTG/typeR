library(hexbin)


### Name: getHMedian
### Title: Get coordiantes of the median cell after the erode operation
### Aliases: getHMedian getHMedian,erodebin-method
### Keywords: methods

### ** Examples

set.seed(153)
x <- rnorm(10000)
y <- rnorm(10000)
bin <- hexbin(x,y)

smbin  <- smooth.hexbin(bin)
erodebin <- erode.hexbin(smbin, cdfcut=.5)
getHMedian(erodebin)



