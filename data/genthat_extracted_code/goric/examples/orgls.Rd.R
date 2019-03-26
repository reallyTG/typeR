library(goric)


### Name: orgls
### Title: Fitting generalized least squares regression models with order
###   restrictions
### Aliases: orgls orgls.formula
### Keywords: models

### ** Examples

# generating example data
library(mvtnorm)
# group means
m <- c(0,5,5,7)
# compound symmetry structure of residuals
# (10 individuals per group, rho=0.7) 
cormat <- kronecker(diag(length(m)*10), matrix(0.7, nrow=length(m), ncol=length(m)))
diag(cormat) <- 1
# different variances per group
sds <- rep(c(1,2,0.5,1), times=10*length(m))
sigma <- crossprod(diag(sds), crossprod(cormat, diag(sds)))
response <- as.vector(rmvnorm(1, rep(m, times=10*length(m)), sigma=sigma))
dat <- data.frame(response,
                  grp=rep(LETTERS[1:length(m)], times=10*length(m)), 
                  ID=as.factor(rep(1:(10*length(m)), each=length(m))))
                  
## set of gls models:
# unconstrained model
m1 <- orgls(response ~ grp-1, data = dat,
            constr=rbind(c(0,0,0,0)), rhs=0, nec=0,
            weights=varIdent(form=~1|grp),
            correlation=corCompSymm(form=~1|ID))

# simple order
m2 <- orgls(response ~ grp-1, data = dat,
            constr=rbind(c(-1,1,0,0),c(0,-1,1,0),c(0,0,-1,1)), rhs=c(0,0,0), nec=0,
            weights=varIdent(form=~1|grp),
            correlation=corCompSymm(form=~1|ID))

# equality constraints
m3 <- orgls(response ~ grp-1, data = dat,
            constr=rbind(c(-1,1,0,0),c(0,-1,1,0),c(0,0,-1,1)), rhs=c(0,0,0), nec=3,
            weights=varIdent(form=~1|grp),
            correlation=corCompSymm(form=~1|ID))



