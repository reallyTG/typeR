library(robustlmm)


### Name: residuals.rlmerMod
### Title: Get residuals
### Aliases: residuals.rlmerMod

### ** Examples

## Not run: 
##D   fm <- rlmer(Yield ~ (1|Batch), Dyestuff)
##D   stopifnot(all.equal(resid(fm, type="weighted"),
##D                       resid(fm) * getME(fm, "w_e")))
## End(Not run)



