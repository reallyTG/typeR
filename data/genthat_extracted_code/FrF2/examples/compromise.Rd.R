library(FrF2)


### Name: compromise
### Title: Function to support estimability requests for compromise designs
### Aliases: compromise
### Keywords: array design

### ** Examples

## seven factors two of which are in group G1
C1 <- compromise(7, c(2,4), class=1)
C1$perms.full  ## the same for all classes
C1$requirement
C2 <- compromise(7, c(2,4), class=2)
C2$requirement
C3 <- compromise(7, c(2,4), class=3)
C3$requirement
C4 <- compromise(7, c(2,4), class=4)
C4$requirement

## Not run: 
##D ########## usage of estimable ###########################
##D   ## design with with BD clear in 16 runs
##D   FrF2(16,7,estimable = C1$requirement)
##D   ## design with BD estimable on a distinct column in 16 runs (any design will do,
##D   ##    if resolution IV!!!
##D   FrF2(16,7,estimable = C1$requirement, clear=FALSE, perms=C1$perms.full)
##D   ## all four classes, mostly clear, for 32 runs
##D   FrF2(32,7,estimable = C1$requirement)
##D   FrF2(32,7,estimable = C2$requirement)   ## requires resolution V
##D          ## as clear class 2 compromise designs do not exist due to Ke et al. 2005
##D   FrF2(32,7,estimable = C2$requirement, clear=FALSE, perms=C2$perms.full)
##D   FrF2(32,7,estimable = C3$requirement)
##D   FrF2(32,7,estimable = C4$requirement)
##D   ## two additional factors H and J that do not show up in the requirement set
##D   FrF2(32,9,estimable = C3$requirement)
##D   ## two additional factors H and J that do not show up in the requirement set
##D   FrF2(32,9,estimable = C3$requirement, clear=FALSE)
##D   ## note that this is not possible for distinct designs in case perms is needed,
##D   ## because perms must have nfactors columns
## End(Not run)



