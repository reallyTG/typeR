library(rstream)


### Name: rstream.incprecision-methods
### Title: Methods for Function rstream.incprecision in Package 'rstream'
### Aliases: rstream.incprecision rstream.incprecision<-
###   rstream.incprecision-methods rstream.incprecision<--methods
###   rstream.incprecision,rstream-method
###   rstream.incprecision<-,rstream-method
###   rstream.incprecision,rstream.mrg32k3a-method
###   rstream.incprecision<-,rstream.mrg32k3a-method
###   rstream.incprecision,rstream.lecuyer-method
###   rstream.incprecision<-,rstream.lecuyer-method
### Keywords: methods distribution datagen

### ** Examples

## create a new rstream object (of subclass rstream.mrg32k3a)
s <- new("rstream.mrg32k3a")

## set increased precision flag of rstream object
rstream.incprecision(s) <- TRUE

## get increased precision flag of rstream object
rstream.incprecision(s)




