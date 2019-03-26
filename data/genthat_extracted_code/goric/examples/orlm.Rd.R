library(goric)


### Name: orlm
### Title: Fitting multivariate regression models with order restrictions
### Aliases: orlm orlm.formula
### Keywords: models

### ** Examples

########################
## Artificial example ##
########################
n <- 10
m <- c(1,2,1,5)
nm <- length(m)
dat <- data.frame(grp=as.factor(rep(1:nm, each=n)),
                  y=rnorm(n*nm, rep(m, each=n), 1))

# unrestricted linear model
cm1 <- matrix(0, nrow=1, ncol=4)
fm1 <- orlm(y ~ grp-1, data=dat, constr=cm1, rhs=0, nec=0)

# order restriction (increasing means)
cm2 <- rbind(c(-1,1,0,0),
             c(0,-1,1,0),
             c(0,0,-1,1))
fm2 <- orlm(y ~ grp-1, data=dat, constr=cm2,
            rhs=rep(0,nrow(cm2)), nec=0)

# order restriction (increasing at least by delta=1)
fm3 <- orlm(y ~ grp-1, data=dat, constr=cm2,
            rhs=rep(1,nrow(cm2)), nec=0)

# larger than average of the neighboring first 2 parameters
cm4 <- rbind(c(-0.5,-0.5,1,0),
             c(0,-0.5,-0.5,1))
fm4 <- orlm(y ~ grp-1, data=dat, constr=cm4,
            rhs=rep(0,nrow(cm4)), nec=0)

# equality constraints (all parameters equal)
fm5 <- orlm(y ~ grp-1, data=dat, constr=cm2,
            rhs=rep(0,nrow(cm2)), nec=nrow(cm2))
            
# alternatively
fm5 <- orlm(y ~ grp-1, data=dat, constr=cm2,
            rhs=rep(0,nrow(cm2)), nec=c(TRUE,TRUE,TRUE))
            
# constraining the 1st and the 4th parameter
# to their true values, and the 2nd and 3rd between them
cm6 <- rbind(c( 1,0,0,0),
             c(-1,1,0,0),
             c(0,-1,0,1),
             c(-1,0,1,0),
             c(0,0,-1,1),
             c(0,0, 0,1))
fm6 <- orlm(y ~ grp-1, data=dat, constr=cm6,
            rhs=c(1,rep(0,4),5), nec=c(TRUE,rep(FALSE,4),TRUE))
            
            
###############################################################
## Example from Kuiper, R.M. and Hoijtink, H. (Unpublished). ##
## A Fortran 90 program for the generalization of the        ##
## order restricted information criterion.                   ##
###############################################################

# constraint definition
cmat <- cbind(diag(3), 0) + cbind(0, -diag(3))
constr <- kronecker(diag(3), cmat)

# no effect model
(fm0 <- orlm(cbind(SDH, SGOT, SGPT) ~ dose-1, data=vinylidene,
             constr=constr, rhs=rep(0, nrow(constr)), nec=nrow(constr)))

# order constrained model (increasing serum levels with increasing doses)
fm1 <- orlm(cbind(SDH, SGOT, SGPT) ~ dose-1, data=vinylidene,
            constr=constr, rhs=rep(0, nrow(constr)), nec=0)
summary(fm1)

# unconstrained model
(fmunc <- orlm(cbind(SDH, SGOT, SGPT) ~ dose-1, data=vinylidene,
               constr=matrix(0, nrow=1, ncol=12), rhs=0, nec=0))



