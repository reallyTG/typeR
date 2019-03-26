library(splancs)


### Name: inout
### Title: Test points for inclusion in a polygon
### Aliases: inout
### Keywords: spatial

### ** Examples

data(uganda)
suganda <- sbox(uganda$poly)
ruganda <- csr(suganda, 1000)
polymap(suganda)
polymap(uganda$poly, add=TRUE)
def <- inout(ruganda, uganda$poly, bound=NULL)
pointmap(as.points(ruganda[def,1], ruganda[def,2]), add=TRUE, col="black")
pointmap(as.points(ruganda[!def,1], ruganda[!def,2]), add=TRUE, col="red")
tru <- inout(ruganda, uganda$poly, bound=TRUE, quiet=FALSE)
which(tru & !def)
ds1 <- as.points(expand.grid(x=seq(-1.5,1.5,0.5), y=seq(-1.5,1.5,0.5)))
ds1.poly <- ds1[chull(ds1),]
ds2 <- as.points(rnorm(300),rnorm(300))
plot(ds2, type="n", asp=1)
polymap(ds1.poly, add=TRUE, border="lightblue", col="lightblue", lwd=1)
points(ds2[inout(ds2,ds1.poly),],  col="green",  pch=20)
points(ds2[!inout(ds2,ds1.poly),], col="orange", pch=20)
points(ds1[inout(ds1,ds1.poly),],  col="black",  pch=20)
points(ds1[!inout(ds1,ds1.poly),], col="red",    pch=20)
plot(ds2, type="n", asp=1)
polymap(ds1.poly, add=TRUE, border="lightblue", col="lightblue", lwd=1)
points(ds2[inout(ds2,ds1.poly,bound=TRUE),],  col="green",  pch=20)
points(ds2[!inout(ds2,ds1.poly,bound=TRUE),], col="orange", pch=20)
points(ds1[inout(ds1,ds1.poly,bound=TRUE),],  col="black",  pch=20)
points(ds1[!inout(ds1,ds1.poly,bound=TRUE),], col="red",    pch=20)
plot(ds2, type="n", asp=1)
polymap(ds1.poly, add=TRUE, border="lightblue", col="lightblue", lwd=1)
points(ds2[inout(ds2,ds1.poly,bound=FALSE),],  col="green",  pch=20)
points(ds2[!inout(ds2,ds1.poly,bound=FALSE),], col="orange", pch=20)
points(ds1[inout(ds1,ds1.poly,bound=FALSE),],  col="black",  pch=20)
points(ds1[!inout(ds1,ds1.poly,bound=FALSE),], col="red",    pch=20)



