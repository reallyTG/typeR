library(GPoM)


### Name: poLabs
### Title: Polynomial labels order
### Aliases: poLabs

### ** Examples

#Regressor order for three variables \eqn{(X1,X2,X3)} (nVar = 3) for a maximum
#polynomial degree equal to 2 (dMax = 2): poLabs(3,2)
#and for two variables only : poLabs(2,2)

# For a quadratic equation of two variables,
# the polynomial \deqn{P(X1,X2) = 0.5 + 0.3 X1 -0.25 X1 X2}
# could thus be written as a vector Pvec such as:
Pvec = c(0.5, 0, 0, 0.3, -0.25, 0)
# considering the convention corresponding to
poLabs(2,2)
# Indeed:
poLabs(2, 2, findIt = Pvec!=0)
# An alternative notation can be used with parameter Xnote
poLabs(2, 2, findIt = Pvec!=0, Xnote = 'w')
# or also
poLabs(2, 2, findIt = Pvec!=0, Xnote = c('x','y'))




