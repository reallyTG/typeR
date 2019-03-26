library(SoilHyP)


### Name: SCEoptim
### Title: Shuffled Complex Evolution (SCE) optimisation.
### Aliases: SCEoptim
### Keywords: optimize

### ** Examples


## reproduced from help("optim")

## Rosenbrock Banana function
Rosenbrock <- function(x){
  x1 <- x[1]
  x2 <- x[2]
  100 * (x2 - x1 * x1)^2 + (1 - x1)^2
}
#lower <- c(-10,-10)
#upper <- -lower
ans <- SCEoptim(Rosenbrock, c(-1.2,1), control = list(trace = 1))
str(ans)

## 'Wild' function, global minimum at about -15.81515
Wild <- function(x)
  10*sin(0.3*x)*sin(1.3*x^2) + 0.00001*x^4 + 0.2*x+80
ans <- SCEoptim(Wild, 0, lower = -50, upper = 50,
                control = list(trace = 1))
ans$par




