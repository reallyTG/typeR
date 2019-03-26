library(sarima)


### Name: filterCoef
### Title: Coefficients and other basic properties of filters
### Aliases: filterCoef filterOrder filterPoly
### Keywords: ts

### ** Examples

filterPoly(as(c(0.3, 0.5), "BJFilter"))   # 1 - 0.3*x - 0.5*x^2
filterPoly(as(c(0.3, 0.5), "SPFilter"))   # 1 + 0.3*x + 0.5*x^2

## now two representations of the same filter:
fi1 <- as(c(0.3, 0.5), "BJFilter")
fi2 <- as(c(-0.3, -0.5), "SPFilter")
identical(fi2, fi1) # FALSE, but
## fi1 and fi2 represent the same filter, eg. same ch. polynomials:
filterPoly(fi1)
filterPoly(fi2)
identical(filterPolyCoef(fi2), filterPolyCoef(fi1))

# same as above, using new()
fi1a <- new("BJFilter", coef = c(0.3, 0.5))
identical(fi1a, fi1) # TRUE

fi2a <- new("SPFilter", coef = c(-0.3, -0.5))
identical(fi2a, fi2) # TRUE

## conversion by as() changes the internal representation
## but represents the same filter:
identical(as(fi1, "SPFilter"), fi2) # TRUE

c(filterOrder(fi1), filterOrder(fi2))

## these give the internally stored coefficients:
filterCoef(fi1)
filterCoef(fi2)

## with argument 'convention' the result doesn't depend
## on the internal representation:
co1 <- filterCoef(fi1, convention = "SP")
co2 <- filterCoef(fi2, convention = "SP")
identical(co1, co2) # TRUE



