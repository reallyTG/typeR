library(dae)


### Name: mat.Vpred
### Title: Calculates the variances of a set of predicted effects from a
###   mixed model
### Aliases: mat.Vpred
### Keywords: array design

### ** Examples

## Reduced example from Smith et al. (2015)
## Generate two-phase design
mill.fac <- fac.gen(list(Mrep = 2, Mday = 2, Mord = 3))
field.lay <- fac.gen(list(Frep = 2, Fplot = 4))
field.lay$Variety <- factor(c("D","E","Y","W","G","D","E","M"), 
                            levels = c("Y","W","G","M","D","E"))
start.design <- cbind(mill.fac, field.lay[c(3,4,5,8,1,7,3,4,5,8,6,2),])
rownames(start.design) <- NULL

## Set up matrices
n <- nrow(start.design)
W <- model.matrix(~ -1+ Variety, start.design)
ng <- ncol(W)
Gg<- diag(1, ng)
Vu <- with(start.design, fac.vcmat(Mrep, 0.3) + 
                         fac.vcmat(fac.combine(list(Mrep, Mday)), 0.2) + 
                         fac.vcmat(Frep, 0.1) + 
                         fac.vcmat(fac.combine(list(Frep, Fplot)), 0.2))
R <- diag(1, n)
  
## Calculate the variance matrix of the predicted random Variety effects
Vp <- mat.Vpred(W = W, Gg = Gg, Vu = Vu, R = R)
designAmeasures(Vp)

## Calculate the variance matrix of the predicted fixed Variety effects, 
## elminating the grand mean
Vp.reduc <- mat.Vpred(W = W, Gg = 0, Vu = Vu, R = R, 
                      eliminate = projector(matrix(1, nrow = n, ncol = n)/n))
designAmeasures(Vp.reduc)



