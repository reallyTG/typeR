library(rationalfun)


### Name: rationalfun
### Title: Construction of rational functions
### Aliases: rationalfun rationalfun.poly rfun rfun.poly

### ** Examples

# (x + 1) / (x^2 + 2 * x + 3)
r1 <- rationalfun(c(1, 1), c(3, 2, 1))
print(r1)
# Construct from objects of 'polynomial' class
if (require(polynom)) {
    p1 <- poly.calc(c(1, 2))
    p2 <- polynomial(rep(1, 5))
    r2 <- rfun.poly(p1, p2)
    print(r2)
}



