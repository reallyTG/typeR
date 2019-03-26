library(rstream)


### Name: rstream.packed-methods
### Title: Methods for Function rstream.packed in Package 'rstream'
### Aliases: rstream.packed rstream.packed<- rstream.packed-methods
###   rstream.packed<--methods rstream.packed,rstream-method
###   rstream.packed<-,rstream-method
###   rstream.packed,rstream.mrg32k3a-method
###   rstream.packed<-,rstream.mrg32k3a-method
###   rstream.packed,rstream.runif-method
###   rstream.packed<-,rstream.runif-method
###   rstream.packed,rstream.lecuyer-method
###   rstream.packed<-,rstream.lecuyer-method
### Keywords: methods distribution datagen

### ** Examples

## create a new rstream object (of subclass rstream.mrg32k3a)
s <- new("rstream.mrg32k3a")

## pack rstream object
rstream.packed(s) <- TRUE

## status of object 
rstream.packed(s)

## pack rstream object
rstream.packed(s) <- FALSE




