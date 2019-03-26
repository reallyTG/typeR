library(garray)


### Name: amap
### Title: Mapping matching dimension of arrays with a function
### Aliases: amap Ops.garray

### ** Examples

a <- garray(1:24, c(4,6,2), dimnames=list(X=1:4, Y=letters[1:6], Z=NULL),
	sdim=list(XX=c(x1=3,x2=1), YY=c(y1=1,y2=2)))
b <- garray(1:6/10,6,dimnames=list(Y=letters[1:6]))
c <- garray(1:4/100,c(X=4))
d <- garray(1:4/1000,c(Y=4))
e <- garray(1:2/1000,c(X=2))
f <- garray(0,c(Z=2))
g <- garray(0,c(ZZ=2))
m1 <- amap(psummary,c,a,b,      0.0001, VECTORIZED=FALSE)
m2 <- amap(sum,     c,a,b,      0.0001, VECTORIZED=FALSE)
m3 <-               c+a+b+      0.0001
n1 <- amap(sum,     c,a,b,d,    0.0001, VECTORIZED=FALSE)
n2 <- amap(sum,     c,a,b,e,    0.0001, VECTORIZED=FALSE)
n3 <- amap(sum,     c,a,b,e,f,  0.0001, VECTORIZED=FALSE)
p1 <- amap(sum,     c,a,b,e,f,g,0.0001, VECTORIZED=FALSE)
q1 <- amap(sum, c,a,b,e,f,g,0.0001, SIMPLIFY=FALSE, VECTORIZED=FALSE)
q2 <- amap(c,   c,a,b,e,f,g,0.0001, SIMPLIFY=FALSE, VECTORIZED=FALSE)
q3 <- amap(list,c,a,b,e,f,g,0.0001, SIMPLIFY=FALSE, VECTORIZED=FALSE)
m1==m2
m2==m3
m2==aperm(m3, 3:1)



