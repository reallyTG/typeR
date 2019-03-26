library(spls)


### Name: sgpls
### Title: Fit SGPLS classification models
### Aliases: sgpls
### Keywords: models multivariate

### ** Examples

    data(prostate)

    # SGPLS with eta=0.6 & 3 hidden components
    (f <- sgpls(prostate$x, prostate$y, K=3, eta=0.6, scale.x=FALSE))

    # Print out coefficients
    coef.f <- coef(f)
    coef.f[coef.f!=0, ]



