library(commandr)


### Name: Pipeline-class
### Title: Pipeline: A Sequence of Protocols
### Aliases: class:Pipeline Pipeline-class Pipeline findProtocols pipeline
###   protocol protocol<- [,Pipeline-method [<-,Pipeline-method
###   head,Pipeline-method tail,Pipeline-method pipeline,Pipeline-method
###   protocol,Pipeline-method protocol<-,Pipeline-method
###   findProtocols,Pipeline-method c,Pipeline-method
###   displayName,Pipeline-method inType,Pipeline-method
###   outType,Pipeline-method parameters,Pipeline-method
###   perform,Pipeline-method

### ** Examples

setStage("average", intype = "numeric")
setProtocol("mean", fun = mean, parent = "average")
setProtocol("quantile", representation = list(probs = "numeric"),
            fun = quantile, parent = "average")
setProtocol("range", representation = list(low = "numeric", high = "numeric"), 
            fun = function(x, low = 0, high = Inf) x[x >= low & x <= high],
            parent = setStage("trim", intype = "numeric"))

d <- c(1, 2, 4)
p <- Pipeline("trim", "average")
perform(p, d)

p <- Pipeline(Protocol("trim", low = 2), "average")
perform(p, d)

p <- Pipeline(Protocol("trim", low = 2),
              Protocol("average", "quantile", probs = 0.75),
              displayName = "Filter and Average")
perform(p, d)

## accessor
inType(p)
outType(p)
parameters(p)
protocol(p, "average")
protocol(p, "average", "quantile")
displayName(p)

## utils
findProtocols(p, "average")

## subsetting
# make a new example
setStage("DemoCastN2C", intype = "numeric", outtype = "character")
setProtocol("cast", fun = function(x){
               message("Convert from numeric to character")
               as.character(x)
            },
            parent = "DemoCastN2C")

setStage("DemoCastC2F", intype = "character", outtype = "factor")
setProtocol("cast", fun = function(x){
               message("Convert from character to factor")
               as.factor(x)
            },
            parent = "DemoCastC2F")

setStage("DemoCastF2L", intype = "factor", outtype = "list")
setProtocol("cast", fun = function(x){
               message("Convert from factor to list")
               as.list(x)
            },
            parent = "DemoCastF2L")

d <- 1:3
p <- Pipeline(Protocol("DemoCastN2C"),
              Protocol("DemoCastC2F"),
              Protocol("DemoCastF2L"))
p
perform(p, d)
# subsetting
# convert to a factor
p12 <- p[1:2]
p12
perform(p12, d)

#
p23 <- pipeline(p, intype = "character")
p23
perform(p23, as.character(d))

#
p12 <- head(p, 2)
p12
#or
head(p, outtype = "factor")
head(p, role = "DemoCastC2F")

tail(p, 2)
tail(p, intype = "character")
tail(p, intype = "factor")
tail(p, role = "DemoCastC2F")

#combination
p1 <- Pipeline(Protocol("DemoCastN2C"))
p2 <- Pipeline(Protocol("DemoCastC2F"))
p3 <- Pipeline(Protocol("DemoCastF2L"))
c(p1 ,p2)
p[2] <- p2

setClass("ExChar", contains = "character")

setStage("DemoCastC2FV2", intype = "ExChar", outtype = "factor")
setProtocol("cast", fun = function(x){
               as.factor(x)
            },
            parent = "DemoCastC2FV2")

p4 <- Pipeline(Protocol("DemoCastC2FV2"))

## Not run: 
##D ## doesn't work, input 'charcter' is super class of output 'ExChar'.
##D p[2] <- p4
## End(Not run)
p

## as a subclass, works.
setStage("DemoCastN2CV2", intype = "numeric", outtype = "ExChar")
setProtocol("cast", fun = function(x){
               new("ExChar", as.character(x))
            },
            parent = "DemoCastN2CV2")
p5 <- Pipeline(Protocol("DemoCastN2CV2"))
p[1] <- p5
p

## Not run: 
##D ## won't work, because the outtype doesn't match the intype.
##D c(p1, p3, p2)
##D p[c(1, 3)]
##D p[2] <- p3
## End(Not run)



