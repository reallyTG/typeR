library(HoRM)


### Name: poly2form
### Title: Expands Design Matrix Based on Polynomials
### Aliases: poly2form
### Keywords: file

### ** Examples
 
## Evaluating the order 5 Legendre polynomials.

require(orthopolynom)

px <- legendre.polynomials(n = 5, normalized = FALSE)
lx <- poly2form(poly.out = px, x = 1:10)

lx




