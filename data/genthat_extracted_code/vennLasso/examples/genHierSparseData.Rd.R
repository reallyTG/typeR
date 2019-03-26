library(vennLasso)


### Name: genHierSparseData
### Title: function to generate data with hierarchical sparsity
### Aliases: genHierSparseData

### ** Examples

set.seed(123)

dat.sim <- genHierSparseData(ncats = 3, nvars = 100, nobs = 200)

# estimate hier.sparsity.param for 0.15 total proportion of nonzero variables
# among vars with hierarchical zero patterns
## Not run: 
##D hsp <- estimate.hier.sparsity.param(ncats = 3, nvars = 50, avg.hier.zeros = 0.15, nsims = 100)
## End(Not run)
# the above results in the following value
hsp <- 0.6270698

# check that this does indeed achieve the desired level of sparsity
mean(replicate(50, mean(genHierSparseBeta(ncats = 3, 
                       nvars = 50, hier.sparsity.param = hsp) != 0)  ))
                           
dat.sim2 <- genHierSparseData(ncats = 3, nvars = 100, nobs = 200, hier.sparsity.param = hsp)

sparseBeta <- genHierSparseBeta(ncats = 3, nvars = 100, hier.sparsity.param = hsp)

## generate data with already generated beta
dat.sim3 <- genHierSparseData(ncats = 3, nvars = 100, nobs = 200, beta = sparseBeta)




## complete example:
## 50% sparsity:
hsp <- 0.2626451

dat.sim <- genHierSparseData(ncats = 3, nvars = 25,
                             nobs = 150, nobs.test = 1000,
                             hier.sparsity.param = hsp,
                             prop.zero.vars = 0.5,
                             effect.size.max = 0.25,
                             family = "gaussian")

x        <- dat.sim$x
x.test   <- dat.sim$x.test
y        <- dat.sim$y
y.test   <- dat.sim$y.test
grp      <- dat.sim$group.ind
grp.test <- dat.sim$group.ind.test

fit.adapt <- cv.vennLasso(x, y,
                          grp,
                          adaptive.lasso = TRUE,
                          nlambda        = 25,
                          family         = "gaussian",
                          abs.tol        = 1e-5,
                          rel.tol        = 1e-5,
                          maxit          = 1000,
                          irls.maxit     = 15L,
                          gamma          = 0.2,
                          standardize    = FALSE,
                          intercept      = TRUE,
                          nfolds         = 3,
                          model.matrix   = TRUE)

preds.a <- predict(fit.adapt$vennLasso.fit, x.test, grp.test, s = fit.adapt$lambda.min,
                   type = 'response')





