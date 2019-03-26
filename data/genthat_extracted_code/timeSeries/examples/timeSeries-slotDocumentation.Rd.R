library(timeSeries)


### Name: attributes
### Title: Get and Set Optional Attributes of a 'timeSeries'
### Aliases: attributes documentation getAttributes setAttributes<-
### Keywords: programming

### ** Examples

## Create an artificial timeSeries Object - 
   tS <- dummySeries()
   tS

## Get Optional Attributes -
   getAttributes(tS)
   tS@documentation
   
## Set a new Optional Attribute -
   setAttributes(tS) <- list(what="A dummy Series")
   tS
   getAttributes(tS)
   tS@documentation



