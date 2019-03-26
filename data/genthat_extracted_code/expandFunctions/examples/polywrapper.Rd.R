library(expandFunctions)


### Name: polywrapper
### Title: Generate special functions using orthonormal functions
### Aliases: polywrapper

### ** Examples

# Generate a Chebyshev function of the form
# chebyFUN(x,k), where x is the input and k is the order.
# In this case, k must be no more than 5 (since that
# is the value passed to kMax), although it is
# easy to set this to a higher order if desired.
chebyFUN <- polywrapper(basePoly=orthopolynom::chebyshev.t.polynomials,
  kMax=5)
# Now the function chebyFUN
# can be used as any other function:
x <- seq(-1,+1,0.01)
plot(x,chebyFUN(x,5),type="l")
eOuter(seq(-1,+1,0.01),0:3,chebyFUN)



