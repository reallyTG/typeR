library(rstream)


### Name: rstream.RNG
### Title: Get and set "rstream" object from/to R global generator
### Aliases: rstream.RNG
### Keywords: methods distribution datagen

### ** Examples

## create a new rstream.runif object
s <- new("rstream.mrg32k3a")

## use this stream as global R uniform RNG
rstream.RNG(s)

## get a (idenpendent) copy of the stream
## that contains the global R uniform RNG
gs <- rstream.RNG()

## change the state of the global generator
gs <- rstream.RNG()
rstream.nextsubstream(gs)
rstream.RNG(gs)




