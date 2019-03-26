library(gtx)


### Name: gls.approx.logistic
### Title: Calculate weights and transformed phenotype so that one
###   iteration of generalised least squares approximates a logistic
###   regression.
### Aliases: gls.approx.logistic

### ** Examples

data(mthfrex)
mthfrex <- gls.approx.logistic(mthfrex, "HTN", c("SexC", "Age"))
xtwx <- make.moments2(mthfr.params, c("HTNstar", "SexC", "Age"), mthfrex,
                      weightvar = "weight")
est.moments2(xtwx, "HTNstar", c("ONE", "rs6668659_T", "rs4846049_T",
                                "rs1801133_G", "SexC", "Age"), vscale=1)



