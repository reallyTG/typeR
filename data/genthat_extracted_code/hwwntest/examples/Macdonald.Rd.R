library(hwwntest)


### Name: Macdonald
### Title: Compute the Macdonald density function for a specified parameter
###   value 'm' at a vector of 'x' values.
### Aliases: Macdonald
### Keywords: distribution

### ** Examples

#
# Work out density at x=0, 0.5 and 1 for the m=1 Macdonald density
#
Macdonald(x=c(0,0.5,1), m=2)
#[1] 0.3535534 0.2975933 0.2075131
#
# Check that the density integrates to one, e.g. for m=3
#
integrate(Macdonald, lower=-20, upper=20, m=3)
#1 with absolute error < 4.7e-07



