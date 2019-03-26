## ------------------------------------------------------------------------
## test masked transformation

# set of 10 parameters
par <- 3*(1:10)
cat("par:")
print(par)

cat("Mask 3rd, 5th, 7th\n")
bdmsk<-rep(1,10) # indicator of parameters that are free
bdmsk[3] <- 0
bdmsk[5] <- 0
bdmsk[7] <- 0
cat("bdmsk:")
print(bdmsk)

# want to produce xpar which are the reduced parameters
iactive <- which(bdmsk == 1)
cat("iactive (length=",length(iactive),"):")
print(iactive)

xpar <- par[iactive]
cat("xpar:")
print(xpar)
xpar <- - xpar
print("altered xpar:")
print(xpar)

cat("expand back to newpar\n")
newpar <- par
newpar[iactive] <- xpar
cat("newpar:")
print(newpar)

# Need to combine with scaling to get full setup for optimr()

# Then also think of the transfinite approach for bounds on unconstrained
## Or even for bounds methods but using unconstrained part.


## ------------------------------------------------------------------------
  nlmfn <- function(spar, ...){
     f <- efn(spar, ...)
     g <- egr(spar, ...)
     attr(f,"gradient") <- g
     attr(f,"hessian") <- NULL # ?? maybe change later
     f
  }

## ----eval=FALSE----------------------------------------------------------
#     print.level <- control$trace
#     control$trace <- NULL

