library(cgwtools)


### Name: inverse.seqle
### Title: Inverse of 'seqle'
### Aliases: inverse.seqle

### ** Examples


x<- c(2,2,2,3:8,8,8,4,4,4,5,5.5,6)
y<-seqle(x,incr=0)
inverse.seqle(y,0)
y <- seqle(x,incr=1)
inverse.seqle(y)
inverse.seqle(y,2) # not what you wanted



