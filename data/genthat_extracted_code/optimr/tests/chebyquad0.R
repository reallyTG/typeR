## chebyquad.R -- Fletcher's Chebyquad problem

# Ref: Fletcher, R. (1965) Function minimization without calculating derivatives -- a review,
#         Computer J., 8, 33-41.


# Note we do not have all components here e.g., .jsd, .h

cyq.f <- function (x) {
  rv<-cyq.res(x)
  f<-sum(rv*rv)
}

cyq.res <- function (x) {
# Fletcher's chebyquad function m = n -- residuals 
   n<-length(x)
   res<-rep(0,n) # initialize
   for (i in 1:n) { #loop over resids
     rr<-0.0
     for (k in 1:n) {
	z7<-1.0
	z2<-2.0*x[k]-1.0
        z8<-z2
        j<-1
        while (j<i) {
            z6<-z7
            z7<-z8
            z8<-2*z2*z7-z6 # recurrence to compute Chebyshev polynomial
            j<-j+1
        } # end recurrence loop
        rr<-rr+z8
      } # end loop on k
      rr<-rr/n
      if (2*trunc(i/2) == i) { rr <- rr + 1.0/(i*i - 1) }
      res[i]<-rr
    } # end loop on i
    res
}

cyq.jac<- function (x) {
#  Chebyquad Jacobian matrix
   n<-length(x)
   cj<-matrix(0.0, n, n)
   for (i in 1:n) { # loop over rows
     for (k in 1:n) { # loop over columns (parameters)
       z5<-0.0
       cj[i,k]<-2.0
       z8<-2.0*x[k]-1.0 
       z2<-z8
       z7<-1.0
       j<- 1
       while (j<i) { # recurrence loop
         z4<-z5
         z5<-cj[i,k]
         cj[i,k]<-4.0*z8+2.0*z2*z5-z4
         z6<-z7
         z7<-z8
         z8<-2.0*z2*z7-z6
         j<- j+1
       } # end recurrence loop
       cj[i,k]<-cj[i,k]/n
     } # end loop on k
   } # end loop on i
   cj
}


cyq.g <- function (x) {
   cj<-cyq.jac(x)
   rv<-cyq.res(x)
   gg<- as.vector(2.0* rv %*% cj)
}

cyq.setup <- function (n = NULL) {
  cat("Fletcher chebyquad function in file cyq.R\n")

  if (is.null(n)) {
     n <- as.numeric(readline("order of problem (n) ="))
  }

  lower<-rep(-10.0, n)
  upper<-rep(10.0, n) 
  bdmsk<-rep(1, n) # free all parameters
  x <- 1:n
  x <- x/(n+1.0) # Initial value suggested by Fletcher
  result <- list(x=x, lower=lower, upper=upper, bdmsk=bdmsk)
} # end cyq.setup

# ------ end functions ------



cat("Takes a long time, so there is an artificial variable skiprun set TRUE\n")

skiprun <- TRUE
## tmp <- readline("Skip run :")
## if (length(tmp) == 0) { skiprun <- TRUE } else { skiprun <- FALSE }

if (skiprun) {
    cat("Skipping Chebyquad\n")
} else {
cat("running Chebyquad test\n")

nn <- c(2, 4, 7, 10, 20)
require(optimr)

for (i in 1:length(nn)) {
   n <- nn[i]
   cat("setting up problem of order=",n,"\n")
   strt <- cyq.setup(n)
   x0 <- strt$x
   lo <- strt$lower
   up <- strt$upper
   cat("n = ", n,"\n")
#   au <- opm(x0, cyq.f, cyq.g, method="ALL", control=list(trace=1))
    au <- opm(x0, cyq.f, cyq.g, control=list(all.methods=TRUE, trace=1))
   print(summary(au, order=value))
}

}
