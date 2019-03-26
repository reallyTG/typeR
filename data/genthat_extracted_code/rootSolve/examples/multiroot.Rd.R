library(rootSolve)


### Name: multiroot
### Title: Solves for n roots of n (nonlinear) equations.
### Aliases: multiroot
### Keywords: optimize

### ** Examples

## =======================================================================
## example 1  
## 2 simultaneous equations
## =======================================================================

model <- function(x) c(F1 = x[1]^2+ x[2]^2 -1, 
                       F2 = x[1]^2- x[2]^2 +0.5)

(ss <- multiroot(f = model, start = c(1, 1)))

## =======================================================================
## example 2
## 3 equations, two solutions
## =======================================================================

model <- function(x) c(F1 = x[1] + x[2] + x[3]^2 - 12,
                       F2 = x[1]^2 - x[2] + x[3] - 2,
                       F3 = 2 * x[1] - x[2]^2 + x[3] - 1 )

# first solution
(ss <- multiroot(model, c(1, 1, 1), useFortran = FALSE))
(ss <- multiroot(f = model, start = c(1, 1, 1)))

# second solution; use different start values
(ss <- multiroot(model, c(0, 0, 0)))
model(ss$root)

## =======================================================================
## example 2b: same, but with parameters
## 3 equations, two solutions
## =======================================================================

model2 <- function(x, parms) 
      c(F1 = x[1] + x[2] + x[3]^2 - parms[1],
        F2 = x[1]^2 - x[2] + x[3] - parms[2],
        F3 = 2 * x[1] - x[2]^2 + x[3] - parms[3])

# first solution
parms <- c(12, 2, 1)
multiroot(model2, c(1, 1, 1), parms = parms)
multiroot(model2, c(0, 0, 0), parms = parms*2)

## =======================================================================
## example 3: find a matrix
## =======================================================================

f2<-function(x)   {
 X <- matrix(nrow = 5, x)
 X %*% X %*% X -matrix(nrow = 5, data = 1:25, byrow = TRUE)
}
x <- multiroot(f2, start = 1:25 )$root
X <- matrix(nrow = 5, x)

X%*%X%*%X



