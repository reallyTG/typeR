library(spray)


### Name: homog
### Title: Various functions to create simple spray objects
### Aliases: homog product homog linear lone one xyz
### Keywords: symbolmath

### ** Examples

product(1:3)                   #      x * y^2 * z^3
homog(3)                       #      x + y + z
homog(3,2)                     #      x^2  + xy + xz + y^2 + yz + z^2
linear(1:3)                    #      1*x + 2*y + 3*z
linear(1:3,2)                  #      1*x^2 + 2*y^2 + 3*z^2
lone(3)                        #      z
lone(2,3)                      #      y
one(3)                         #      1
zero(3)                        #      0
xyz(3)                         #      xyz



