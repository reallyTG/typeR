library(rstream)


### Name: rstream.mrg32k3a-class
### Title: Class "rstream.mrg32k3a" - Multiple streams with MRG32k3a
###   backbone generator from Pierre L'Ecuyers RngStreams package
### Aliases: rstream.mrg32k3a-class initialize,rstream.mrg32k3a-method
###   print,rstream.mrg32k3a-method
### Keywords: classes distribution datagen

### ** Examples

## create a new rstream.mrg32k3a object
s <- new("rstream.mrg32k3a")

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

## jump to next substream
rstream.nextsubstream(s)

## make a clone of the rstream object
sc <- rstream.clone(s)

## pack and unpack the rstream object
rstream.packed(s) <- TRUE
rstream.packed(s) <- FALSE




