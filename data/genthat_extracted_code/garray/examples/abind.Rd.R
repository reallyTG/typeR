library(garray)


### Name: abind
### Title: Combine generalized arrays
### Aliases: abind

### ** Examples

a <- garray(1:24, c(4,6),
	dimnames=list(X=1:4, Y=letters[1:6]),
 	sdim=list(XX=c(x1=3,x2=1), YY=c(y1=1,y2=2)))
b <- garray(1:6/10,6,dimnames=list(Y=letters[1:6]))
ab <- abind(a=a, b=b, along="X")
#abind(a, b, margins=c("X","Y"))	# Error
ab2 <- abind(a=a, b=b, margins=c("X","Y"), along="X")
aa <- abind(a=a, a=a, along="Z")
ab3 <- abind(a, b, along="X")



