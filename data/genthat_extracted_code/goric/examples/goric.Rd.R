library(goric)


### Name: goric
### Title: Calculate GORIC
### Aliases: goric goric.orlm goric.orgls goric.list goric.orglm
### Keywords: models

### ** Examples

## Example from Kuiper, R.M. and Hoijtink, H. (Unpublished).
# A Fortran 90 program for the generalization of the 
# order restricted information criterion.
# constraint definition
cmat <- cbind(diag(3), 0) + cbind(0, -diag(3))
constr <- kronecker(diag(3), cmat)
constr

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

# calculate GORIC
# (only small number of iterations to decrease computation time, default: iter=100000)
goric(fm0, fm1, fmunc, iter=1000)



