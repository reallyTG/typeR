library(mpoly)


### Name: deriv.mpoly
### Title: Compute partial derivatives of a multivariate polynomial.
### Aliases: deriv.mpoly

### ** Examples

m <- mp('x y + y z + z^2')
deriv(m, 'x')
deriv(m, 'y')
deriv(m, 'z')
deriv(m, c('x','y','z'))
deriv(m, 'a')
is.mpoly(deriv(m, 'x'))
is.mpolyList( deriv(m, c('x','y','z')) )



