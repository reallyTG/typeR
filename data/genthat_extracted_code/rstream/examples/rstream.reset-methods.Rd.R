library(rstream)


### Name: rstream.reset-methods
### Title: Methods for Function rstream.reset in Package 'rstream'
### Aliases: rstream.reset rstream.reset-methods
###   rstream.reset,rstream-method rstream.reset,rstream.mrg32k3a-method
###   rstream.reset,rstream.runif-method
###   rstream.reset,rstream.lecuyer-method
### Keywords: methods distribution datagen

### ** Examples

## create a new rstream object (of subclass rstream.mrg32k3a)
s <- new("rstream.mrg32k3a")

## generate a sample
x <- rstream.sample(s,10)

## reset the stream object
rstream.reset(s)

## the new sample y is identical to x
y <- rstream.sample(s,10)
if (identical(x,y)) print("x and y are identical samples")




