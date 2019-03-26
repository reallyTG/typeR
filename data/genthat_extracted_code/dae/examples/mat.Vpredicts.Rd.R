library(dae)


### Name: mat.Vpredicts
### Title: Calculates the variances of a set of predicted effects from a
###   mixed model, based on supplied matrices or formulae.
### Aliases: mat.Vpredicts
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

## Set gammas
terms <- c("Variety", "Frep", "Frep:Fplot", "Mrep", "Mrep:Mday", "Mrep:Mday:Mord")
gammas <- c(1, 0.1, 0.2, 0.3, 0.2, 1)
names(gammas) <- terms

## Specify matrices to calculate the variance matrix of the predicted fixed Variety effects 
W <- model.matrix(~ -1 + Variety, start.design)
Vu <- with(start.design, fac.vcmat(Mrep, gammas["Mrep"]) + 
                         fac.vcmat(fac.combine(list(Mrep,Mday)), gammas["Mrep:Mday"]) + 
                         fac.vcmat(Frep, gammas["Frep"]) + 
                         fac.vcmat(fac.combine(list(Frep,Fplot)), gammas["Frep:Fplot"]))
R <- diag(1, nrow(start.design))
  
## Calculate variance matrix
Vp <- mat.Vpredicts(target = W, random=Vu, R=R)

## Calculate the variance matrix of the predicted random Variety effects using formulae
Vp <- mat.Vpredicts(target = ~ -1 + Variety, Gt = 1, 
                    fixed = ~ 1, 
                    random = ~ -1 + Mrep/Mday + Frep/Fplot, 
                    G = as.list(gammas[c(4,5,2,3)]), 
                    R = R, design = start.design)
designAmeasures(Vp)

## Calculate the variance matrix of the predicted fixed Variety effects, 
## elminating the grand mean
n <- nrow(start.design)
Vp.reduc <- mat.Vpredicts(target = ~ -1 + Variety, 
                          random = ~ -1 + Mrep/Mday + Frep/Fplot, 
                          G = as.list(gammas[c(4,5,2,3)]), 
                          eliminate = projector(matrix(1, nrow = n, ncol = n)/n), 
                          design = start.design)
designAmeasures(Vp.reduc)



