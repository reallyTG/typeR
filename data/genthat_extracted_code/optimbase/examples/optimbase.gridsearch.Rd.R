library(optimbase)


### Name: optimbase.gridsearch
### Title: Grid evaluation of a constrained or unconstrained cost function
### Aliases: optimbase.gridsearch
### Keywords: method

### ** Examples


# Problem: find x and y that maximize 3.6*x - 0.4*x^2 + 1.6*y - 0.2*y^2 and
#          satisfy the constrains:
#            2*x - y <= 10
#            x >= 0
#            y >= 0
#

gridfun <- function(x=NULL,index=NULL,fmsfundata=NULL,...){

  f <- c()
  c <- c()
  if (index == 2 | index == 6)
    f <- -(3.6*x[1] - 0.4*x[1]*x[1] + 1.6*x[2] - 0.2*x[2]*x[2])
  if (index == 5 | index == 6)
    c <- c(10 - 2*x[1] - x[2],
           x[1],
           x[2])
  varargout <- list(f = f, g = c(), c = c, gc = c(), index = index)

  return(varargout)
}


x0 <- c(0.35,0.3)
npts <- 6
alpha <- 10

res <- optimbase.gridsearch(fun=gridfun,x0=x0,xmin=NULL,xmax=NULL,
                     npts=npts,alpha=alpha)

# 3.5 and 3 is the actual solution of the optimization problem
print(res)




