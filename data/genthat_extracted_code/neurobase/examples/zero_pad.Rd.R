library(neurobase)


### Name: zero_pad
### Title: Zero pads an image
### Aliases: zero_pad

### ** Examples

kdim = c(3,3,5)
img = array(rnorm(30*30*36), dim = c(30, 30, 36))
pad = zero_pad(img, kdim)
back = zero_pad(pad, kdim, invert=TRUE)
all.equal(back, img)



