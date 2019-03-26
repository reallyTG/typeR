require(optimx)

# Note that solving 1 dimensional problems with multi-dimensional
# minimizers can be unpredictable!

  f1<-function(xx){ # function of one parameter
    ((3*xx+2)*xx-5)*xx+4  ## 3*xx^3 + 2*xx^2 -5*xx + 4
  }

  g1 <- function(xx){
     gg <- 9*xx*xx+4*xx -5
  }
  x0 <- .1234
  lb <- -1
  ub <- 10


  cat("R has optimize function for [1D] functions\n")
  aoptimize <- optimize(f1, c(-1, 10))
  print(aoptimize)

  cat("or we can use optim() with method='Brent' \n")
  abrent <- optim(x0, f1, lower=lb, upper=ub, method="Brent", control=list(trace=0))
  print(abrent)

  ansone<-opm(x0, f1, g1, method = c("Rvmmin", "Rcgmin"), control=list(trace=0))
  ansone.sum<-summary(ansone, order=value)
  print(ansone.sum)

# test 2
  x0 = 1
  cat("Start with x0=1. Use optim() with method='Brent' \n")
  abrent1 <- optim(x0, f1, lower=lb, upper=ub, method="Brent", control=list(trace=0))
  print(abrent1)

  ansone1<-opm(x0, f1, g1,  lower=lb, upper=ub, method = c("Rvmmin", "Rcgmin"),  control=list(trace=0))
  ansone1.sum<-summary(ansone1, order=value)
  print(ansone1.sum)

