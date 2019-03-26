library(coda.base)


### Name: sbp_basis
### Title: Isometric log-ratio basis based on Balances Build an 'ilr_basis'
###   using a sequential binary partition or a generic coordinate system
###   based on balances.
### Aliases: sbp_basis

### ** Examples

X = data.frame(a=1:2, b=2:3, c=4:5, d=5:6, e=10:11, f=100:101, g=1:2)
sbp_basis(b1 = a~b+c+d+e+f+g,
          b2 = b~c+d+e+f+g,
          b3 = c~d+e+f+g,
          b4 = d~e+f+g,
          b5 = e~f+g,
          b6 = f~g, data = X)
sbp_basis(b1 = a~b,
         b2 = b1~c,
         b3 = b2~d,
         b4 = b3~e,
         b5 = b4~f,
         b6 = b5~g, data = X)
# A non-orthogonal basis can also be calculated.
sbp_basis(b1 = a+b+c~e+f+g,
          b2 = d~a+b+c,
          b3 = d~e+g,
          b4 = a~e+b,
          b5 = b~f,
          b6 = c~g, data = X)



