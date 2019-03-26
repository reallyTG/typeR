library(SNSequate)


### Name: eqp.eq
### Title: The equipercentile method of equating
### Aliases: eqp.eq eqp.eq.default
### Keywords: Traditional equating methods

### ** Examples

### Example from Kolen and Brennan (2004), pages 41-42:
### (scores distributions have been transformed to vectors of scores)

sx<-c(0,0,1,1,1,2,2,3,3,4)
sy<-c(0,1,1,2,2,3,3,3,4,4)
x<-2
eqp.eq(sx,sy,2)

# Whole scale range (Table 2.3 in KB)
eqp.eq(sx,sy,0:4)




