## ---- eval = FALSE-------------------------------------------------------
#  install.packages("devtools")
#  devtools::install_github("jaredhuling/vennLasso")

## ---- warning=FALSE, message=FALSE---------------------------------------
library(vennLasso)

## ----simdata-------------------------------------------------------------
set.seed(123)
dat.sim <- genHierSparseData(ncats = 3,   # number of binary stratifying factors
                             nvars = 50,  # number of variables
                             nobs = 150,  # number of observations per subpopulation
                             nobs.test = 5000,
                             hier.sparsity.param = 0.6, # the following two parameters
                             prop.zero.vars = 0.5,      # determine how many variables 
                             family = "gaussian")       # have no impact on response

# design matrices
x        <- dat.sim$x      # one for training
x.test   <- dat.sim$x.test # one for testing

# response vectors
y        <- dat.sim$y
y.test   <- dat.sim$y.test

# binary stratifying factors
grp      <- dat.sim$group.ind
grp.test <- dat.sim$group.ind.test

## ----fitmodel------------------------------------------------------------
fit1 <- vennLasso(x = x, y = y, groups = grp, adaptive.lasso = TRUE)

## ----lookatcoefs---------------------------------------------------------
round(fit1$beta[,1:10,35], 3)

## ----truecoefs-----------------------------------------------------------
round(dat.sim$beta.mat[,1:9], 3)

## ----plotpaths, fig.height = 8, fig.cap = "Coefficient paths for each subpopulation. The subpopulation denoted by '0,1,1' is the subpopulation of samples who have the second and third binary factor but not the first, the '0,1,0' subpopulation is the subpopulation of those who have only the second binary factor, and so on."----
layout(matrix(1:9, ncol = 3))
for (i in 1:nrow(fit1$beta)) plot(fit1, which.subpop = i, xvar = "loglambda")

## ----cvvennlasso---------------------------------------------------------
cvfit1 <- cv.vennLasso(x = x, y = y, groups = grp, adaptive.lasso = TRUE, nfolds = 5)

## ----minlam--------------------------------------------------------------
cvfit1$lambda.min

## ----plotcv--------------------------------------------------------------
plot(cvfit1)

## ----predict_cv----------------------------------------------------------
preds <- predict(cvfit1, 
                 newx = x.test, 
                 group.mat = grp.test, 
                 s = "lambda.min")
mean((y.test - preds) ^ 2)
mean((y.test - mean(y.test)) ^ 2)

## ----fitmodel_confint----------------------------------------------------
fit2 <- vennLasso(x = x, y = y, groups = grp, 
                  adaptive.lasso = TRUE,
                  gamma = 1,
                  conf.int = 0.90)   # specify the confidence level (90% here) for CIs

## ----lookatcis-----------------------------------------------------------
round(fit2$lower.ci[,7:11,35], 3)
round(fit2$upper.ci[,7:11,35], 3)

