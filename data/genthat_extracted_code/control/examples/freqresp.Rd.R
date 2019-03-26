library(control)


### Name: freqresp
### Title: Low level frequency response function
### Aliases: freqresp

### ** Examples

H <- freqresp(ssdata(tf(c(1,1), c(1,2,1))), (seq(0, 100, length = 10000)))
H <- freqresp(tf(c(1,1), c(1,2,1)), seq(0, 100, length = 10000))




