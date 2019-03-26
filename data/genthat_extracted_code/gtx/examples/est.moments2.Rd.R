library(gtx)


### Name: est.moments2
### Title: Estimate regression coefficients using quadratic approximation
###   to likelihood function.
### Aliases: est.moments2

### ** Examples

data(mthfrex)
mthfrex <- gls.approx.logistic(mthfrex, "HTN", c("SexC", "Age"))
xtwx <- make.moments2(mthfr.params, c("HTNstar", "SexC", "Age"), mthfrex,
                      weightvar = "weight")
myglm <- est.moments2(xtwx, "HTNstar", c("ONE", "rs6668659_T", "rs4846049_T",
                                "rs1801133_G", "SexC", "Age"), vscale=1)
myglm$z <- myglm$betahat/myglm$se
cbind(beta = myglm$betahat, se = myglm$se, z = myglm$z, 
      pval = pnorm(-abs(myglm$z))*2)

## Compare against results from glm
## Note have to use coded alleles used in original data
mycheck <- glm(HTN ~ rs6668659_G+rs4846049_G+rs1801133_A+Sex+Age,
               family="binomial", data = mthfrex$data)
coef(summary(mycheck))
## Note in results Sex factor coded differently than SexC
## Coefficients for covariates used in null model are different,
##     because xtwx approximates around the fitted null model

## Look at pairwise correlations
cor(subset(mthfrex$data, select = c("rs6668659_G", "rs4846049_G",
                                    "rs1801133_A")))^2

## SNP coefficients well approximated (given very high
## inter-SNP correlations) but signs ALL inverted by coded allele flips

## check error less than 10percent
stopifnot(all(-1*myglm$z[2:4]/coef(summary(mycheck))[2:4,3] > 0.9))
stopifnot(all(-1*myglm$z[2:4]/coef(summary(mycheck))[2:4,3] < 1.1))



