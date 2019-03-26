library(spatstat)


### Name: as.data.frame.owin
### Title: Convert Window to Data Frame
### Aliases: as.data.frame.owin
### Keywords: spatial methods

### ** Examples

   as.data.frame(square(1))

   holey <- owin(poly=list(
                        list(x=c(0,10,0), y=c(0,0,10)),
                        list(x=c(2,2,4,4), y=c(2,4,4,2))))
   as.data.frame(holey)

   M <- as.mask(holey, eps=0.5)
   Mdf <- as.data.frame(M)



