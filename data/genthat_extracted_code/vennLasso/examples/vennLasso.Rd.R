library(vennLasso)


### Name: vennLasso
### Title: Fitting vennLasso models
### Aliases: vennLasso

### ** Examples

library(Matrix)

# first simulate heterogeneous data using
# genHierSparseData
set.seed(123)
dat.sim <- genHierSparseData(ncats = 2, nvars = 25,
                             nobs = 200, 
                             hier.sparsity.param = 0.5,
                             prop.zero.vars = 0.5,
                             family = "gaussian")

x          <- dat.sim$x
conditions <- dat.sim$group.ind
y          <- dat.sim$y

true.beta.mat <- dat.sim$beta.mat

fit <- vennLasso(x = x, y = y, groups = conditions)

(true.coef <- true.beta.mat[match(dimnames(fit$beta)[[1]], rownames(true.beta.mat)),])
round(fit$beta[,,21], 2)

## fit adaptive version and compute confidence intervals
afit <- vennLasso(x = x, y = y, groups = conditions, conf.int = 0.95, adaptive.lasso = TRUE)

(true.coef <- true.beta.mat[match(dimnames(fit$beta)[[1]], rownames(true.beta.mat)),])[,1:10]
round(afit$beta[,1:10,28], 2)
round(afit$lower.ci[,1:10,28], 2)
round(afit$upper.ci[,1:10,28], 2)

aic.idx <- which.min(afit$aic)
bic.idx <- which.min(afit$bic)

# actual coverage
# actual coverage
mean(true.coef[afit$beta[,-1,aic.idx] != 0] >= 
             afit$lower.ci[,-1,aic.idx][afit$beta[,-1,aic.idx] != 0] &
         true.coef[afit$beta[,-1,aic.idx] != 0] <= 
             afit$upper.ci[,-1,aic.idx][afit$beta[,-1,aic.idx] != 0])

(covered <- true.coef >= afit$lower.ci[,-1,aic.idx] & true.coef <= afit$upper.ci[,-1,aic.idx])
mean(covered)


# logistic regression example
set.seed(123)
dat.sim <- genHierSparseData(ncats = 2, nvars = 25,
                             nobs = 200, 
                             hier.sparsity.param = 0.5,
                             prop.zero.vars = 0.5,
                             family = "binomial",
                             effect.size.max = 0.5) # don't make any 
                                                    # coefficients too big

x           <- dat.sim$x
conditions  <- dat.sim$group.ind
y           <- dat.sim$y
true.beta.b <- dat.sim$beta.mat

bfit <- vennLasso(x = x, y = y, groups = conditions, family = "binomial")

(true.coef.b <- -true.beta.b[match(dimnames(fit$beta)[[1]], rownames(true.beta.b)),])
round(bfit$beta[,,20], 2)




