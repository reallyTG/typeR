library(PolynomF)


### Name: poly.calc
### Title: Functions to generate polynomials in several standard ways
### Aliases: poly.calc poly.from.values poly.from.zeros poly.from.roots
###   poly.orth
### Keywords: symbolmath

### ** Examples

x <- polynom()
H <- polylist(1, x)
for(j in 2:10)
  H[[j+1]] <- x*H[[j]] - (j-1)*H[[j-1]]
Hf <- as.function(H)
x0 <- -5:5
y0 <- Hf(x0)
J <- poly.from.values(x0, y0)
all.equal(H[[11]], J[[11]])

p1 <- poly.from.zeros(-3:2)
p2 <- poly.from.zeros(0:4)
p3 <- GCD(p1, p2)
p4 <- LCM(p1, p2)

solve(polylist(p1, p2, p3, p4))

po <- poly.orth(-4:4, degree = 4)
plot(po)

round(crossprod(as.function(po)(-4:4)), 10)




