library(optimization)


### Name: optim_nm
### Title: Optimization with Nelder-Mead
### Aliases: optim_nm

### ** Examples


#####  Rosenbrock function
# minimum at f(1,1) = 0
   B <- function(x){
    100*(x[2]-x[1]^2)^2+(1-x[1])^2
  }

##### Minimization with an initial guess at c(-2.048, 2.048)
  optim_nm(B, start = c(-2.048, 2.048))

#####  Himmelblau's function
# minimum at f(3,2) = 0
# f(-2.805, -3.1313) = 0
# f(-3.779, -3.283) = 0
#f(3.5844, -1.848) = 0
  H <- function(x){
    (x[1]^2+x[2]-11)^2+(x[1]+x[2]^2-7)^2
  }

##### Minimization with defined number of parameters
  optim_nm(fun = H, k = 2)

##### Colville function with 4 parameters
  co <- function(x){
    x1 <- x[1]
    x2 <- x[2]
    x3 <- x[3]
    x4 <- x[4]

    term1 <- 100 * (x1^2 - x2)^2
    term2 <- (x1 - 1)^2
    term3 <- (x3-1)^2
    term4 <- 90 * (x3^2 - x4)^2
    term5 <- 10.1 * ((x2 - 1)^2 + (x4 - 1)^2)
    term6 <- 19.8 * (x2 - 1)*(x4-1)

     y <- term1 + term2 + term3 + term4 + term5 + term6
  }

  optim_nm(co, k = 4)

#### Minimization with trace
  Output <- optim_nm(H, k = 2, trace = TRUE)
  plot(Output)
  plot(Output, 'contour')




