library(geometa)


### Name: ISODimension
### Title: ISODimension
### Aliases: ISODimension
### Keywords: ISO dimension

### ** Examples

   #create dimension
   md <- ISODimension$new()
   md$setName("row")
   md$setSize(1)
   md$setResolution(ISOLength$new(value=1,uom="m"))
   xml <- md$encode()
   



