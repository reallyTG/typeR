### R code from vignette source '/Users/amanialmohaimeed/Desktop/PhD/package/boxcoxmix/inst/doc/boxcoxmix.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: boxcoxmix.Rnw:332-337
###################################################
library(boxcoxmix)
data(strength, package="mdscore")
test.inv <- np.boxcoxmix(y ~ cut *lot, data = strength, K = 3,  
                         tol = 1.8,  start = "gq", lambda = -1, verbose=FALSE) 
test.inv


###################################################
### code chunk number 2: boxcoxmix.Rnw:343-346
###################################################
test.gauss <- np.boxcoxmix(y ~ cut *lot, data = strength, K = 3,  
                         tol = 1.8,  start = "gq", lambda = 1, verbose=FALSE) 
test.gauss


###################################################
### code chunk number 3: boxcoxmix.Rnw:353-357 (eval = FALSE)
###################################################
## test.optim <- optim.boxcox(y ~ cut*lot, data = strength,  K = 3,
##                            tol = 1.8, start = "gq", find.in.range = c(-3, 3),
##                            s = 60) 
## plot(test.optim, 8)


###################################################
### code chunk number 4: boxcoxmix.Rnw:374-377
###################################################
library(npmlreg)
inv.gauss <- alldist(y ~ cut*lot,  data = strength, k = 3,   tol = 0.45, verbose=FALSE) 
inv.gauss


###################################################
### code chunk number 5: boxcoxmix.Rnw:529-534
###################################################
data(Oxboys, package="nlme")
Oxboys$boy <- gl(26,9)
Oxboys$boy 
testox <- np.boxcoxmix(height ~  age, groups = Oxboys$boy,  data = Oxboys, 
                       K = 6, tol = 1, start = "gq", lambda=1, verbose=FALSE)


###################################################
### code chunk number 6: boxcoxmix.Rnw:538-539
###################################################
plot(testox, 1)


###################################################
### code chunk number 7: boxcoxmix.Rnw:550-553 (eval = FALSE)
###################################################
## testo <- optim.boxcox(height ~ age, groups = Oxboys$boy, data = Oxboys, 
##          K = 6,  tol =1, start = "gq",  find.in.range=c( -1.2, 0.1),  s=15)
## plot(testo, 8)


