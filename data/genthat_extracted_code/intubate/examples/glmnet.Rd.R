library(intubate)


### Name: glmnet
### Title: Interfaces for glmnet package for data science pipelines.
### Aliases: ntbt_glmnet ntbt_cv.glmnet
### Keywords: intubate magrittr glmnet cv.glmnet

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(glmnet)
##D 
##D 
##D ## NOTE: glmnet package does not implement formula interface. As I need it
##D ##       for teaching purposes, this is the first pure non-formula library
##D ##       included, as a proof of concept that not only the functions with
##D ##       formula + data variant can be successfully interfaced to use in
##D ##       a pipeline.
##D 
##D 
##D library(ISLR)
##D data("Hitters")
##D Hitters <- na.omit(Hitters)
##D 
##D dta <- list(x = model.matrix(Salary ~ ., Hitters)[, -1],  ## Remove intercept
##D             y = model.frame(Salary ~ ., Hitters)[, 1])
##D grid <- 10^seq(10, -2, length = 100)
##D 
##D ## ntbt_glmnet: fit a GLM with lasso or elasticnet regularization
##D 
##D ## Original function to interface
##D attach(dta)
##D ## Ridge Regression
##D ridge <- glmnet(x, y, alpha = 0, lambda = grid)
##D plot(ridge)
##D 
##D ## The Lasso
##D lasso <- glmnet(x, y, alpha = 1, lambda = grid)
##D plot(lasso)
##D detach()
##D 
##D ## The interface puts data as first parameter
##D ## Ridge Regression
##D ridge <- ntbt_glmnet(dta, x, y, alpha = 0, lambda = grid)
##D plot(ridge)
##D 
##D ## The Lasso
##D lasso <- ntbt_glmnet(dta, x, y, alpha = 1, lambda = grid)
##D plot(lasso)
##D 
##D ## so it can be used easily in a pipeline.
##D ## Ridge Regression
##D dta %>%
##D   ntbt_glmnet(x, y, alpha = 0, lambda = grid) %>%
##D   plot()
##D 
##D ## The Lasso
##D dta %>%
##D   ntbt_glmnet(x, y, alpha = 1, lambda = grid) %>%
##D   plot()
##D 
##D 
##D ## ntbt_cv.glmnet: Cross-validation for glmnet
##D 
##D ## Original function to interface
##D attach(dta)
##D ## Ridge Regression
##D set.seed(1)
##D cv.ridge <- cv.glmnet(x, y, alpha = 0)
##D plot(cv.ridge)
##D 
##D ## The Lasso
##D cv.lasso <- cv.glmnet(x, y, alpha = 1)
##D plot(cv.lasso)
##D detach()
##D 
##D ## The interface puts data as first parameter
##D ## Ridge Regression
##D set.seed(1)
##D cv.ridge <- ntbt_cv.glmnet(dta, x, y, alpha = 0)
##D plot(cv.ridge)
##D 
##D ## The Lasso
##D cv.lasso <- ntbt_cv.glmnet(dta, x, y, alpha = 1)
##D plot(cv.lasso)
##D 
##D ## so it can be used easily in a pipeline.
##D ## Ridge Regression
##D set.seed(1)
##D dta %>%
##D   ntbt_cv.glmnet(x, y, alpha = 0) %>%
##D   plot()
##D 
##D ## The Lasso
##D dta %>%
##D   ntbt_cv.glmnet(x, y, alpha = 1) %>%
##D   plot()
## End(Not run)



