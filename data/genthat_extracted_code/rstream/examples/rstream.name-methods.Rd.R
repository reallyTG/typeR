library(rstream)


### Name: rstream.name-methods
### Title: Methods for Function rstream.name in Package 'rstream'
### Aliases: rstream.name rstream.name<- rstream.name-methods
###   rstream.name<--methods rstream.name,rstream-method
###   rstream.name<-,rstream-method rstream.name,rstream.mrg32k3a-method
###   rstream.name<-,rstream.mrg32k3a-method
###   rstream.name,rstream.runif-method rstream.name<-,rstream.runif-method
###   rstream.name,rstream.lecuyer-method
###   rstream.name<-,rstream.lecuyer-method
### Keywords: methods distribution datagen

### ** Examples

## create a new rstream object (of subclass rstream.mrg32k3a)
s <- new("rstream.mrg32k3a")

## set name of rstream object
rstream.name(s) <- "mystream"

## get name of rstream object
rstream.name(s)




