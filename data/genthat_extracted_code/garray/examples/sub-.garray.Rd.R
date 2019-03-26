library(garray)


### Name: [.garray
### Title: Indexing for the garray class
### Aliases: [.garray [ [<- [<-.garray

### ** Examples

mm <- matrix(c(1:3,1), 2, 2, dimnames=list(NULL, c("B","A")))
a <- garray(1:27, c(A=3,B=9), sdim=list(AA=c(a=2,b=1),BB=c(a=3)))
b <- a[mm]
c1 <- a[B=1:2,A=NULL]
c2 <- a[B=1:2,A=]
c3 <- a[B=1:2]
c4 <- a[list(B=1:2)]
c5 <- a[list(B=1:2,A=NULL)]
c6 <- a[list(NULL,1:2)]
d1 <- a[,] ; d1[B=1:2,A=NULL]       <- c1*10
d2 <- a[,] ; d2[B=1:2,A=]           <- c1*10
d3 <- a[,] ; d3[B=1:2]              <- c1*10
d4 <- a[,] ; d4[list(B=1:2)]        <- c1*10
d5 <- a[,] ; d5[list(B=1:2,A=NULL)] <- c1*10
d6 <- a[,] ; d6[B=1:2,A=NULL] <- 1
d7 <- a[,] ; d7[mm] <- 1000
d8 <- a[,] ; d8[mm] <- 1:2*1000
e1 <- a[AA=1,drop=FALSE]
e11 <- a[AA=c(1,1),drop=FALSE]
e2 <- a[AA="b",drop=FALSE]
ebb <- a[AA=c("b","b"),drop=FALSE]
e3 <- a[,] ; e3[AA="b"] <- e2*10
e33 <- a[,] ; e33[AA=c("b","b")] <- c(e2*0.1, e2*100)
# Work in the same manner of `e33[c(3,3),] <- c(e2*0.1, e2*100)`.
e4 <- a[A=c(TRUE,FALSE,FALSE),drop=FALSE]
e5 <- a[A=TRUE,drop=FALSE]
e6 <- a[B=c(TRUE,FALSE,FALSE),drop=FALSE]
e7 <- a[AA=TRUE,drop=FALSE]
e8 <- a[AA=c(TRUE,FALSE),drop=FALSE]



