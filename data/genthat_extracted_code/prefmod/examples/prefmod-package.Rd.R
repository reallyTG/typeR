library(prefmod)


### Name: prefmod-package
### Title: 'prefmod': Utilities to Fit Paired Comparison Models for
###   Preferences
### Aliases: prefmod-package prefmod
### Keywords: package

### ** Examples

# mini example with three Likert items and two subject covariates

# using example data "xmpl" in the package
dsgnmat <- patt.design(xmpl, nitems = 3, resptype = "rating",
    ia = TRUE, cov.sel = "ALL")
head(dsgnmat)

# fit of Critchlov & Fligner (1991) Salad Dressings Data
pattR.fit(salad, nitems = 4)

# alternatively use glm() with patt.design()
sal <- patt.design(salad, nitems = 4, resptype = "ranking")
glm(y ~ A+B+C+D, data = sal, family = poisson)



