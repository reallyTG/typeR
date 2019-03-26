library(pracma)


### Name: aitken
### Title: Aitken' Method
### Aliases: aitken
### Keywords: math

### ** Examples

# Find a zero of    f(x) = cos(x) - x*exp(x)
# as fixpoint of  phi(x) = x + (cos(x) - x*exp(x))/2
phi <- function(x) x + (cos(x) - x*exp(x))/2
aitken(phi, 0)  #=> 0.5177574



