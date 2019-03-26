library(intubate)


### Name: lars
### Title: Interfaces for lars package for data science pipelines.
### Aliases: ntbt_lars ntbt_cv.lars
### Keywords: intubate magrittr lars cv.lars

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(lars)
##D 
##D 
##D library(ISLR)
##D data("Hitters")
##D Hitters <- na.omit(Hitters)
##D 
##D dta <- list(x = model.matrix(Salary ~ ., Hitters)[, -1],  ## Remove intercept
##D             y = model.frame(Salary ~ ., Hitters)[, 1])
##D 
##D ## ntbt_lars: Fits Least Angle Regression, Lasso and Infinitesimal
##D ##            Forward Stagewise regression models
##D 
##D ## Original function to interface
##D attach(dta)
##D lasso <- lars(x, y)
##D plot(lasso)
##D detach()
##D 
##D ## The interface puts data as first parameter
##D lasso <- ntbt_lars(dta, x, y)
##D plot(lasso)
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_lars(x, y) %>%
##D   plot()
##D 
##D 
##D ## ntbt_cv.lars: Computes K-fold cross-validated error curve for lars
##D 
##D ## Original function to interface
##D set.seed(1)
##D attach(dta)
##D cv.lars(x, y)
##D detach()
##D 
##D ## The interface puts data as first parameter
##D set.seed(1)
##D ntbt_cv.lars(dta, x, y)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(1)
##D dta %>%
##D   ntbt_cv.lars(x, y)
## End(Not run)



