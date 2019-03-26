library(seqICP)


### Name: seqICPnl.s
### Title: Non-linear Invariant Causal Prediction for an individual set S
### Aliases: seqICPnl.s

### ** Examples

set.seed(1)

# environment 1
na <- 130
X1a <- rnorm(na,0,0.1)
Ya <- 5*X1a+rnorm(na,0,0.5)
X2a <- Ya+rnorm(na,0,0.1)

# environment 2
nb <- 70
X1b <- rnorm(nb,-1,1)
Yb <- X1b^2+rnorm(nb,0,0.5)
X2b <- rnorm(nb,0,0.1)

# combine environments
X1 <- c(X1a,X1b)
X2 <- c(X2a,X2b)
Y <- c(Ya,Yb)
Xmatrix <- cbind(X1, X2)

# use GAM as regression function
GAM <- function(X,Y){
  d <- ncol(X)
  if(d>1){
    formula <- "Y~1"
    names <- c("Y")
    for(i in 1:(d-1)){
      formula <- paste(formula,"+s(X",toString(i),")",sep="")
      names <- c(names,paste("X",toString(i),sep=""))
    }
    data <- data.frame(cbind(Y,X[,-1,drop=FALSE]))
      colnames(data) <- names
    fit <- fitted.values(mgcv::gam(as.formula(formula),data=data))
  } else{
    fit <- rep(mean(Y),nrow(X))
  }
  return(fit)
}

# apply seqICPnl.s to all possible sets using the regression
# function GAM - only the true parent set S=1 is
# invariant in this example
seqICPnl.s(Xmatrix, Y, S=numeric(), par.test=list(grid=c(0,50,100,150,200)), regression.fun=GAM)
seqICPnl.s(Xmatrix, Y, S=1, par.test=list(grid=c(0,50,100,150,200)), regression.fun=GAM)
seqICPnl.s(Xmatrix, Y, S=2, par.test=list(grid=c(0,50,100,150,200)), regression.fun=GAM)
seqICPnl.s(Xmatrix, Y, S=c(1,2), par.test=list(grid=c(0,50,100,150,200)), regression.fun=GAM)



