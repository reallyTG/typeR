library(lambda.tools)


### Name: anynames
### Title: Get the names of a data structure. This attempts to create some
###   polymorphism around lists, vectors, and data.frames
### Aliases: anynames anynames<-
### Keywords: attribute

### ** Examples

m <- matrix(c(1,2,3,4,5,6), ncol=2)
anynames(m) <- c('d','e')
anynames(m)

v <- c(a=1,b=2,c=3,d=4,e=5)
anynames(v)

l <- list(a=1,b=2,c=3,d=4,e=5)
anynames(l)

df <- data.frame(a=1:10, b=1:10,c=1:10,d=1:10,e=1:10)
anynames(df)



