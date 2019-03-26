library(sensitivity)


### Name: sobolMultOut
### Title: Monte Carlo Estimation of Aggregated Sobol' Indices for multiple
###   and functional outputs
### Aliases: sobolMultOut print.sobolMultOut plot.sobolMultOut
### Keywords: design

### ** Examples

## No test: 
# Functional toy function: Arctangent temporal function (Auder, 2011)
# X: input matrix (in [-7,7]^2)
# q: number of discretization steps of [0,2pi] interval
# output: vector of q values

atantemp <- function(X, q = 100){
  
  n <- dim(X)[[1]]
  t <- (0:(q-1)) * (2*pi) / (q-1)
  
  res <- matrix(0,ncol=q,nrow=n)
  for (i in 1:n) res[i,] <- atan(X[i,1]) * cos(t) + atan(X[i,2]) * sin(t)

  return(res)  
}

# Tests functional toy fct 

y0 <- atantemp(matrix(c(-7,0,7,-7,0,7),ncol=2))
#plot(y0[1,],type="l")
#apply(y0,1,lines)

n <- 100
X <- matrix(c(runif(2*n,-7,7)),ncol=2)
y <- atantemp(X)
x11()
plot(y0[2,],ylim=c(-2,2),type="l")
apply(y,1,lines)

# Sobol indices computations

n <- 1000
X1 <- data.frame(matrix(runif(2*n,-7,7), nrow = n))
X2 <- data.frame(matrix(runif(2*n,-7,7), nrow = n))

x11()
sa <- sobolMultOut(model=atantemp, q=100, X1, X2, 
                   MCmethod="soboljansen", plotFct=TRUE)
print(sa)
x11()
plot(sa)

## End(No test)



