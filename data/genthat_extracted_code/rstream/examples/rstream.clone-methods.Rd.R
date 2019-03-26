library(rstream)


### Name: rstream.clone-methods
### Title: Methods for Function rstream.clone in Package 'rstream'
### Aliases: rstream.clone rstream.clone-methods
###   rstream.clone,rstream-method rstream.clone,rstream.mrg32k3a-method
###   rstream.clone,rstream.runif-method
###   rstream.clone,rstream.lecuyer-method
### Keywords: methods distribution datagen

### ** Examples

## create a new rstream object (of subclass rstream.mrg32k3a)
s <- new("rstream.mrg32k3a")

## make a copy (clone)
clone <- rstream.clone(s)



