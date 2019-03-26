library(elliptic)


### Name: as.primitive
### Title: Converts basic periods to a primitive pair
### Aliases: as.primitive is.primitive
### Keywords: array

### ** Examples

as.primitive(c(3+5i,2+3i))
as.primitive(c(3+5i,2+3i),n=5)

##Rounding error:
is.primitive(c(1,1i))

## Try
 is.primitive(c(1,1.001i))




