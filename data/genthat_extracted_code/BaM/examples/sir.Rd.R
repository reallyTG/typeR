library(BaM)


### Name: sir
### Title: sir
### Aliases: logit.posterior.ll normal.posterior.ll probit.posterior.ll sir
###   t_posterior.ll

### ** Examples

## Not run: 
##D  
##D sir <- function(data.mat,theta.vector,theta.mat,M,m,tol=1e-06,ll.func,df=0) {
##D  importance.ratio <- rep(NA,M)
##D  rand.draw <- rmultinorm(M,theta.vector,theta.mat,tol = 1e-04)
##D  if (df > 0)
##D    rand.draw <- rand.draw/(sqrt(rchisq(M,df)/df))
##D  empirical.draw.vector <- apply(rand.draw,1,ll.func,data.mat)
##D  if (sum(is.na(empirical.draw.vector)) == 0) {
##D    print("SIR: finished generating from posterior density function")
##D    print(summary(empirical.draw.vector))
##D  }
##D  else {
##D    print(paste("SIR: found",sum(is.na(empirical.draw.vector)),
##D                "NA(s) in generating from posterior density function, quiting"))
##D    return()
##D  }
##D  if (df == 0) {
##D    normal.draw.vector <- apply(rand.draw,1,normal.posterior.ll,data.mat)
##D  }
##D  else {
##D    theta.mat <- ((df-2)/(df))*theta.mat
##D    normal.draw.vector <- apply(rand.draw,1,t.posterior.ll,data.mat,df)
##D  }
##D  if (sum(is.na(normal.draw.vector)) == 0) {
##D    print("SIR: finished generating from approximation distribution")
##D    print(summary(normal.draw.vector))
##D  }
##D  else {
##D    print(paste("SIR: found",sum(is.na(normal.draw.vector)),
##D                "NA(s) in generating from approximation distribution, quiting"))
##D    return()
##D  }
##D  importance.ratio <- exp(empirical.draw.vector - normal.draw.vector)
##D  importance.ratio[is.finite=F] <- 0
##D  importance.ratio <- importance.ratio/max(importance.ratio)
##D if (sum(is.na(importance.ratio)) == 0) {
##D  print("SIR: finished calculating importance weights")
##D  print(summary(importance.ratio))
##D }
##D else {
##D   print(paste("SIR: found",sum(is.na(importance.ratio)),
##D               "NA(s) in calculating importance weights, quiting"))
##D   return()
##D }
##D  accepted.mat <- rand.draw[1:2,]
##D while(nrow(accepted.mat) < m+2) {
##D   rand.unif <- runif(length(importance.ratio))
##D   accepted.loc <- seq(along=importance.ratio)[(rand.unif-tol) <= importance.ratio]
##D   rejected.loc <- seq(along=importance.ratio)[(rand.unif-tol) > importance.ratio]
##D   accepted.mat <- rbind(accepted.mat,rand.draw[accepted.loc,])
##D   rand.draw <- rand.draw[rejected.loc,]
##D   importance.ratio <- importance.ratio[rejected.loc]
##D   print(paste("SIR: cycle complete,",(nrow(accepted.mat)-2),"now accepted"))
##D }
##D accepted.mat[3:nrow(accepted.mat),]
##D }
##D # The following are log likelihood functions that can be plugged into the sir function above.
##D 
##D logit.posterior.ll <- function(theta.vector,X) {
##D   Y <- X[,1]
##D   X[,1] <- rep(1,nrow(X))
##D   sum( -log(1+exp(-X
##D                   -log(1+exp(X)))))
##D }
##D 
##D normal.posterior.ll <- function(coef.vector,X) {
##D   dimnames(coef.vector) <- NULL
##D   Y <- X[,1]
##D   X[,1] <- rep(1,nrow(X))
##D   e <- Y - X
##D   sigma <- var(e)
##D   return(-nrow(X)*(1/2)*log(2*pi)
##D          -nrow(X)*(1/2)*log(sigma)
##D          -(1/(2*sigma))*(t(Y-X)*(Y-X)))
##D }
##D 
##D t.posterior.ll <- function(coef.vector,X,df) {
##D   Y <- X[,1]
##D   X[,1] <- rep(1,nrow(X))
##D   e <- Y - X
##D   sigma <- var(e)*(df-2)/(df)
##D   d <- length(coef.vector)
##D  return(log(gamma((df+d)/2)) - log(gamma(df/2))
##D        - (d/2)*log(df)
##D        -(d/2)*log(pi) - 0.5*(log(sigma))
##D        -((df+d)/2*sigma)*log(1+(1/df)*
##D                                (t(Y-X*(Y-X)))))
##D }
##D 
##D probit.posterior.ll <- function (theta.vector,X,tol = 1e-05) {
##D   Y <- X[,1]
##D   X[,1] <- rep(1,nrow(X))
##D   Xb <- X
##D   h <- pnorm(Xb)
##D   h[h<tol] <- tol
##D   g <- 1-pnorm(Xb)
##D   g[g<tol] <- tol
##D   sum( log(h)*Y + log(g)*(1-Y) )
##D }
## End(Not run)




