library(freqdom)


### Name: freqdom
### Title: Create an object corresponding to a frequency domain functional
### Aliases: freqdom
### Keywords: classes

### ** Examples

i = complex(imaginary=1)
OP = array(0, c(2, 2, 3))
OP[,,1] = diag(2) * exp(i)/2
OP[,,2] = diag(2)
OP[,,3] = diag(2) * exp(-i)/2
freq = c(-pi/3, 0, pi/3)
A = freqdom(OP, freq)



