library(popbio)


### Name: image2
### Title: Display a matrix image
### Aliases: image2
### Keywords: color

### ** Examples

data(calathea)

A<-calathea[[11]]

op<-par(mfrow=c(2,2))
image2(A, text.cex=.8)
## with  gray border and labels on bottom right
image2( A, text.cex=.8, border="gray70", labels=c(1,4), mar=c(3,1,1,3))
## no text or box offset
image2( A, box.offset=0, text.col=NA)
# set zeros to NA to print everything but zero 
A[A==0]<-NA
image2( A, box.offset=0 , text.cex=.8)


## if comparing two or more matrices, get the log10 range
## of values (not including zero) and pass to breaks
x<-unlist(calathea[-17])
x<-log10(range(x[x!=0]))
par(mfrow=c(4,4))
for(i in 1:16)
  {
A<-calathea[[i]]
A[A==0]<-NA
image2( A, cex=.7, box.offset=0, breaks=seq(x[1], x[2], len=24))
  title(names(calathea[i]), line=3)
}
par(op)




