library(robustlmm)


### Name: getME
### Title: Extract or Get Generalize Components from a Fitted Mixed Effects
###   Model
### Aliases: getME.rlmerMod getME theta
### Keywords: utilities

### ** Examples

## shows many methods you should consider *before* using getME():
methods(class = "rlmerMod")

## doFit = FALSE to speed up example
(fm1 <- rlmer(Reaction ~ Days + (Days|Subject), sleepstudy,
              method="DASvar", doFit=FALSE))
Z <- getME(fm1, "Z")
stopifnot(is(Z, "CsparseMatrix"),
          c(180,36) == dim(Z),
	  all.equal(fixef(fm1), getME(fm1, "beta"),
		    check.attributes=FALSE, tolerance = 0))

## All that can be accessed [potentially ..]:
(nmME <- eval(formals(robustlmm:::getME.rlmerMod)$name))
## Don't show: 
## internal consistency check ensuring that all work:
## "try(.)" because some are not yet implemented:
str(parts <- sapply(nmME, function(nm) try(getME(fm1, nm)),
                    simplify=FALSE))
## End(Don't show)% dont..
stopifnot(all.equal(theta(fm1), getME(fm1, "theta")))



