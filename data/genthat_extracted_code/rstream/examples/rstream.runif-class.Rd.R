library(rstream)


### Name: rstream.runif-class
### Title: Class "rstream.runif" - Interface to R internal uniform random
###   number generators
### Aliases: rstream.runif-class initialize,rstream.runif-method
###   print,rstream.runif-method
### Keywords: classes distribution datagen

### ** Examples

## create a new rstream.runif object
s <- new("rstream.runif")

## show state of this object
print(s)

## show and change name of stream object
rstream.name(s)
rstream.name(s) <- "mystream"

## get a random number
x <- rstream.sample(s)

## get a random sample of size 100
x <- rstream.sample(s,100)

## reset random stream
rstream.reset(s)

## show and set antithetic flag
rstream.antithetic(s)
rstream.antithetic(s) <- TRUE

## make a clone of the rstream object
sc <- rstream.clone(s)

## pack and unpack the rstream object
rstream.packed(s) <- TRUE
rstream.packed(s) <- FALSE




