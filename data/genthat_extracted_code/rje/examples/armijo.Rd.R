library(rje)


### Name: armijo
### Title: Generic functions to aid finding local minima given search
###   direction
### Aliases: armijo coarseLine
### Keywords: optimize

### ** Examples


# minimisation of simple function of three variables
x = c(0,-2,4)
f = function(x) ((x[1]-3)^2 + x[2]*sin(x[2]) + exp(x[3]) - x[3])

tol = .Machine$double.eps
mv = 1

while (mv > tol) {
  # or replace with coarseLine()
  out = armijo(f, x, sigma=0.1)
  x = out$x
  mv = sum(out$move^2)
}

# correct solution is c(3,0,0)
x




