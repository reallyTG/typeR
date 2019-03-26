library(multipol)


### Name: constant
### Title: Various useful multivariate polynomials
### Aliases: constant homog linear single product zero ones uni lone
### Keywords: array

### ** Examples


product(c(1,2,5))     #   x * y^2 * z^5
uni(3)                #   xyz
single(3,1)           #   x
single(3,2)           #   y
single(3,3)           #   z
single(3,1,6)         #   x^6        
single(3,2,6)         #   y^6
lone(3,1:2)           #   xy
lone(3,c(1,3))        #   xz
linear(c(1,2,5))      #   x + 2y + 5z
ones(3)               #   x+y+z
constant(3)           #   1 + 0x + 0y + 0z
zero(3)               #   0 + 0x + 0y + 0z
homog(3,2)            #   x^2 + y^2 + z^2 + xy + xz + yz

# now some multivariate factorization:

ones(2)*linear(c(1,-1))                                       # x^2-y^2
ones(2)*(linear(c(1,1),2)-uni(2))                             # x^3+y^3
linear(c(1,-1))*homog(2,2)                                    # x^3+y^3 again
ones(2)*(ones(2,4)+uni(2)^2-product(c(1,3))-product(c(3,1)))  # x^5+y^5
ones(2)*homog(2,4,c(1,-1,1,-1,1))                             # x^5+y^5 again
  



