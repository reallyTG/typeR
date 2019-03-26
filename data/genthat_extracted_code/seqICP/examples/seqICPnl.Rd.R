library(seqICP)


### Name: seqICPnl
### Title: Non-linear Invariant Causal Prediction
### Aliases: seqICPnl

### ** Examples

set.seed(2)

# environment 1
na <- 120
X1a <- 0.3*rnorm(na)
X3a <- X1a + 0.2*rnorm(na)
Ya <- 2*X1a^2 + 0.6*sin(X3a) + 0.1*rnorm(na)
X2a <- -0.5*Ya + 0.5*X3a + 0.1*rnorm(na)

# environment 2
nb <- 80
X1b <- 2*rnorm(nb)
X3b <- rnorm(nb)
Yb <- 2*X1b^2 + 0.6*sin(X3b) + 0.1*rnorm(nb)
X2b <- -0.5*Yb + 0.8*rnorm(nb)

# combine environments
X1 <- c(X1a,X1b)
X2 <- c(X2a,X2b)
X3 <- c(X3a,X3b)
Y <- c(Ya,Yb)
Xmatrix <- cbind(X1, X2, X3)

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

# Y follows the same structural assignment in both environments
# a and b (cf. the lines Ya <- ... and Yb <- ...).
# The direct causes of Y are X1 and X3.
# A GAM model fit considers X1, X2 and X3 as significant.
# All these variables are helpful for the prediction of Y.
summary(mgcv::gam(Y~s(X1)+s(X2)+s(X3)))

# apply seqICP to the same setting
seqICPnl.result <- seqICPnl(X = Xmatrix, Y, test="block.variance",
par.test = list(grid = seq(0, na + nb, (na + nb)/10), complements = FALSE, link = sum,
alpha = 0.05, B =100), regression.fun = GAM,  max.parents = 4, stopIfEmpty=FALSE, silent=FALSE)
summary(seqICPnl.result)
# seqICPnl is able to infer that X1 and X3 are causes of Y



