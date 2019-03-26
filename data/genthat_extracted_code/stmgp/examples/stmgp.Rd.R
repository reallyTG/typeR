library(stmgp)


### Name: stmgp
### Title: Smooth-threshold multivariate genetic prediction
### Aliases: stmgp
### Keywords: ~kwd1 ~kwd2

### ** Examples


## Not run: 
##D set.seed(200)
##D 
##D wd = system.file("extdata",package="stmgp")
##D 
##D D = read.table(unzip(paste(wd,"snps.raw.zip",sep="/"),exdir=tempdir()),header=TRUE)
##D 
##D X = D[,-(1:6)]
##D X = (X==1) + 2*(X==2)
##D p = ncol(X)
##D n = nrow(X)
##D ll = 30
##D p0 = 20; b0 = log(rep(1.2,p0))
##D iA0 = sample(1:p,p0)
##D Z = as.matrix(cbind(rnorm(n),runif(n)))  # covariates
##D eta = crossprod(t(X[,iA0]),b0) - 4 + crossprod(t(Z),c(0.5,0.5))
##D 
##D # quantitative trait
##D mu = eta
##D sig = 1.2
##D y = mu + rnorm(n)*sig
##D STq = stmgp(y,X,Z,tau=n*c(1),qb="q",maxal=0.1,gamma=1,ll=ll)
##D boptq = STq$BA[,STq$lopt[1],STq$lopt[2]]
##D nonzeroXq = which( boptq[(1+ncol(Z))+(1:p)]!=0 )
##D cor( STq$Muhat[,STq$lopt[1],STq$lopt[2]], crossprod(t(cbind(1,Z,X)),boptq) )  # check consistency
##D 
##D # binary trait
##D mu = 1/(1+exp(-eta))
##D y = rbinom(n,size=1,prob=mu)
##D STb = stmgp(y,X,Z,tau=n*c(1),qb="b",maxal=0.1,gamma=1,ll=ll)
##D boptb = STb$BA[,STb$lopt[1],STb$lopt[2]]
##D nonzeroXb = which( boptb[(1+ncol(Z))+(1:p)]!=0 )
##D cor( STb$Muhat[,STb$lopt[1],STb$lopt[2]], crossprod(t(cbind(1,Z,X)),boptb) )  # check consistency
##D Prob = 1/(1+exp(-STb$Muhat[,STb$lopt[1],STb$lopt[2]]))  # Pr(y=1) (logistic regression)
##D 
## End(Not run)




