library(MuMIn)


### Name: updateable
### Title: Make a function return updateable result
### Aliases: updateable updateable2 get_call uGamm MuMIn-gamm gamm-wrapper
### Keywords: utils

### ** Examples


# Simple example with cor.test:

# From example(cor.test)
x <- c(44.4, 45.9, 41.9, 53.3, 44.7, 44.1, 50.7, 45.2, 60.1)
y <- c( 2.6,  3.1,  2.5,  5.0,  3.6,  4.0,  5.2,  2.8,  3.8)

ct1 <- cor.test(x, y, method = "kendall", alternative = "greater")

uCor.test <- updateable(cor.test)

ct2 <- uCor.test(x, y, method = "kendall", alternative = "greater")

getCall(ct1) # --> NULL
getCall(ct2)

#update(ct1, method = "pearson") --> Error
update(ct2, method = "pearson")
update(ct2, alternative = "two.sided")


## predefined wrapper for 'gamm':
## Don't show: 
 if(require(mgcv)) { 
## End(Don't show)
set.seed(0)
dat <- gamSim(6, n = 100, scale = 5, dist = "normal")

fmm1 <- uGamm(y ~s(x0)+ s(x3) + s(x2), family = gaussian, data = dat, 
    random = list(fac = ~1))

getCall(fmm1)
class(fmm1)
## Don't show: 
 } 
## End(Don't show)
###

## Not run: 
##D library(caper)
##D data(shorebird)
##D shorebird <- comparative.data(shorebird.tree, shorebird.data, Species)
##D 
##D fm1 <- crunch(Egg.Mass ~ F.Mass * M.Mass, data = shorebird)
##D 
##D uCrunch <- updateable(crunch)
##D 
##D fm2 <- uCrunch(Egg.Mass ~ F.Mass * M.Mass, data = shorebird)
##D 
##D getCall(fm1)
##D getCall(fm2)
##D update(fm2) # Error with 'fm1'
##D dredge(fm2)
## End(Not run)

###
## Not run: 
##D # "lmekin" does not store "formula" element 
##D library(coxme)
##D uLmekin <- updateable(lmekin, eval.args = "formula")
##D 
##D f <- effort ~ Type + (1|Subject)
##D fm1 <- lmekin(f, data = ergoStool)
##D fm2 <- uLmekin(f, data = ergoStool)
##D 
##D f <- wrong ~ formula # reassigning "f"
##D 
##D getCall(fm1) # formula is "f"
##D getCall(fm2) 
##D 
##D formula(fm1) # returns the current value of "f" 
##D formula(fm2)
## End(Not run)



