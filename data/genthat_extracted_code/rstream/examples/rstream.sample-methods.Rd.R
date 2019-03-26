library(rstream)


### Name: rstream.sample-methods
### Title: Methods for Function rstream.sample in Package 'rstream'
### Aliases: rstream.sample r rstream.sample-methods r-methods
###   rstream.sample,rstream-method rstream.sample,rstream,numeric-method
###   r,rstream-method r,rstream,numeric-method
###   rstream.sample,rstream.mrg32k3a-method r,rstream.mrg32k3a-method
###   rstream.sample,rstream.runif-method r,rstream.runif-method
###   rstream.sample,rstream.lecuyer-method r,rstream.lecuyer-method
### Keywords: methods distribution datagen

### ** Examples

## create a new rstream object (of subclass rstream.mrg32k3a)
s <- new("rstream.mrg32k3a")

## get a random number
x <- rstream.sample(s)

## get a random sample of size 100
x <- rstream.sample(s,100)

## alternatively ...
x <- r(s,100)




