library(lme4)


### Name: getME
### Title: Extract or Get Generalized Components from a Fitted Mixed
###   Effects Model
### Aliases: getL getL,merMod-method getME getME.merMod
### Keywords: utilities

### ** Examples

## shows many methods you should consider *before* using getME():
methods(class = "merMod")

(fm1 <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy))
Z <- getME(fm1, "Z")
stopifnot(is(Z, "CsparseMatrix"),
          c(180,36) == dim(Z),
	  all.equal(fixef(fm1), b1 <- getME(fm1, "beta"),
		    check.attributes=FALSE, tolerance = 0))

## A way to get *all* getME()s :
## internal consistency check ensuring that all work:
parts <- getME(fm1, "ALL")
str(parts, max=2)
stopifnot(identical(Z,  parts $ Z),
          identical(b1, parts $ beta))



