library(rstream)


### Name: rstream.antithetic-methods
### Title: Methods for Function rstream.antithetic in Package 'rstream'
### Aliases: rstream.antithetic rstream.antithetic<-
###   rstream.antithetic-methods rstream.antithetic<--methods
###   rstream.antithetic,rstream-method rstream.antithetic<-,rstream-method
###   rstream.antithetic,rstream.mrg32k3a-method
###   rstream.antithetic<-,rstream.mrg32k3a-method
###   rstream.antithetic,rstream.runif-method
###   rstream.antithetic<-,rstream.runif-method
###   rstream.antithetic,rstream.lecuyer-method
###   rstream.antithetic<-,rstream.lecuyer-method
### Keywords: methods distribution datagen

### ** Examples

## create a new rstream object (of subclass rstream.mrg32k3a)
s <- new("rstream.mrg32k3a")

## set antithetic flag of rstream object
rstream.antithetic(s) <- TRUE

## get antithetic flag of rstream object
rstream.antithetic(s)




