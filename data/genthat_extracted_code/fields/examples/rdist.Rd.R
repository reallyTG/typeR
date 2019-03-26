library(fields)


### Name: rdist
### Title: Euclidean distance matrix or vector
### Aliases: rdist fields.rdist.near rdist.vec
### Keywords: spatial

### ** Examples


out<- rdist( ChicagoO3$x)
# out is a 20X20 matrix.

out2<- rdist( ChicagoO3$x[1:5,], ChicagoO3$x[11:20,])
#out2 is a 5X10 matrix

set.seed(123)
x1<- matrix( runif( 20*2), 20,2)
x2<-  matrix( runif( 15*2), 15,2)

out3<- fields.rdist.near( x1,x2, delta=.5)
# out3 is a sparse structure in list format

# or to "save"  work space decrease size of temp array

 out3<- fields.rdist.near( x1,x2, delta=.5,max.points=20*15)

# explicitly reforming as a full matrix 
temp<- matrix( NA, nrow=out3$da[1], ncol= out3$da[2])
temp[ out3$ind] <- out3$ra 

#       or justuse 

  temp<- spind2full( out3)
  image( temp)

# this is  identical to 
 temp2<- rdist( x1,x2)
 temp2[ temp2<= .5] <- NA

#compute pairwise distance vector
x1 = 1:10
x2 = seq(from=10, to=1)
rdist.vec(x1, x2)

#calculate output matrix in compact form:
distOut = rdist(1:10, compact=TRUE)
distOut
as.vector(distOut)



