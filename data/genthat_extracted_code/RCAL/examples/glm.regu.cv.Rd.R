library(RCAL)


### Name: glm.regu.cv
### Title: Regularied M-estimation for fitting generalized linear models
###   based on cross validation
### Aliases: glm.regu.cv

### ** Examples

## No test: 
data(simu.data)
n <- dim(simu.data)[1]
p <- dim(simu.data)[2]-2

y <- simu.data[,1]
tr <- simu.data[,2]
x <- simu.data[,2+1:p]
x <- scale(x)

### Example 1: Regularized maximum likelihood estimation of propensity scores
ps.cv.rml <- glm.regu.cv(fold=5, nrho=1+10, y=tr, x=x, loss="ml")
ps.cv.rml$rho
ps.cv.rml$err.ave
ps.cv.rml$err.sd
ps.cv.rml$sel.rho
ps.cv.rml$sel.nz

fp.cv.rml <- ps.cv.rml $sel.fit[,1]
check.cv.rml <- mn.ipw(x, tr, fp.cv.rml)
check.cv.rml$est

### Example 2: Regularized calibrated estimation of propensity scores
ps.cv.rcal <- glm.regu.cv(fold=5, nrho=1+10, y=tr, x=x, loss="cal")
ps.cv.rcal$rho
ps.cv.rcal$err.ave
ps.cv.rcal$err.sd
ps.cv.rcal$sel.rho
ps.cv.rcal$sel.nz

fp.cv.rcal <- ps.cv.rcal $sel.fit[,1]

check.cv.rcal <- mn.ipw(x, tr, fp.cv.rcal)
check.cv.rcal$est
## End(No test)




