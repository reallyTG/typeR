library(mpoly)


### Name: components
### Title: Polynomial components
### Aliases: components [.mpoly LT LC LM multideg totaldeg monomials
###   exponents

### ** Examples

(p <- mp("x y^2 + x (x+1) (x+2) x z + 3 x^10"))
p[2]
p[-2]
p[2:3]

LT(p)
LC(p)
LM(p)

multideg(p)
totaldeg(p)
monomials(p)

exponents(p)
exponents(p, reduce = TRUE)
lapply(exponents(p), is.integer)

homogeneous_components(p)




