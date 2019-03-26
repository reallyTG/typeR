library(garray)


### Name: amult
### Title: Generalized array multiplication.
### Aliases: amult %X%

### ** Examples

a <- garray(1:24, c(4,6), list(X=LETTERS[1:4], Y=letters[1:6]),
	sdim=list(XX=c(x1=3,x2=1), YY=c(y1=1,y2=2)))
b <- garray(1:20, c(Z=5, X=4))
c <- garray(1:120, c(X=4,Y=6,Z=5))
m1 <- amult(a, b)
m2 <- amult(a, b, `*`, sum)
m3 <- amult(b, a)
all.equal(m1, m2)
all.equal(m1, m3)
all.equal(m1, t(m3))
n1 <- amult(a, c, `*`, sum)
n2 <- a%X%c
all.equal(n1, n2)
amult(garray(1:5,margins="I"), garray(1:8,margins="J"))
amult(garray(1:8,c(I=2,J=4)), garray(1:9,c(K=3,L=3)))



