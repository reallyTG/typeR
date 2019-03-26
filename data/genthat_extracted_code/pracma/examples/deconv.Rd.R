library(pracma)


### Name: deconv
### Title: Deconvolution
### Aliases: deconv
### Keywords: timeseries

### ** Examples

b <- c(10, 40, 100, 160, 170, 120)
a <- c(1, 2, 3, 4)

p <- deconv(b, a)
p$q                #=> 10 20 30
p$r                #=>  0  0  0



