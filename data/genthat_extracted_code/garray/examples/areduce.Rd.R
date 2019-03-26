library(garray)


### Name: areduce
### Title: Generalized and smart apply()/Reduce()/tapply() for data
###   folding.
### Aliases: areduce

### ** Examples

a <- garray(1:24, c(4,6),
	dimnames=list(X=LETTERS[1:4], Y=letters[1:6]),
	sdim=list(XX=c(x1=3,x2=1), YY=c(y1=1,y2=2)))
x1 <- areduce("sum", a, c("X"))
x2 <- areduce(`sum`, a, c("X"))
stopifnot(garray(c(66,72,78,84), margins="X")==x1, x2==x1)
yy1 <- areduce("sum", a, c("YY"))
yy2 <- areduce(`sum`, a, c("YY"))
stopifnot(garray(c(10,68,58,164), margins="Y")==yy1, yy2==yy1)
xyy1 <- areduce("sum", a, c("X","YY"))
xyy2 <- areduce(`sum`, a, c("X","YY"))
stopifnot(xyy1==xyy2)
xxyy1 <- areduce("sum", a, c("XX","YY"))
xxyy2 <- areduce(`sum`, a, c("XX","YY"))
stopifnot(garray(c(6,4,48,20,42,16,120,44), c(X=2,Y=4))==xxyy1)
stopifnot(xxyy2==xxyy1)
b <- garray(1:24, c(3,4,2),
	dimnames=list(X=LETTERS[1:3], Y=letters[1:4], Z=NULL),
	sdim=list(XX=c(x1=2,x2=1), YY=c(y1=1,y2=1)))
xxyyz1 <- areduce("sum", b, c("XX","YY","Z"))
xxyyz2 <- areduce(`sum`, b, c("XX","YY","Z"))
stopifnot(xxyyz1==xxyyz2)
xyz1 <- areduce(identity, b, c("XX","YY","Z"), SIMPLIFY=FALSE)
xyz2 <- areduce("c",      b, c("XX","YY","Z"), SIMPLIFY=FALSE)
xy1 <- areduce(identity, b, c("XX","YY"), SIMPLIFY=FALSE, SAFE=TRUE)
stopifnot(identical(dimnames(xy1[2,3][[1]]), list(X="C",Y="c",Z=NULL)))
# garray of lists, cannot use `xyz1==xyz2` etc to compare.



