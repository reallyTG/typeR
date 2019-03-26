library(VGAM)


### Name: fff
### Title: F Distribution Family Function
### Aliases: fff
### Keywords: models regression

### ** Examples

## Not run: 
##D fdata <- data.frame(x2 = runif(nn <- 2000))
##D fdata <- transform(fdata, df1 = exp(2+0.5*x2),
##D                           df2 = exp(2-0.5*x2))
##D fdata <- transform(fdata, y   = rf(nn, df1, df2))
##D fit <- vglm(y  ~ x2, fff, data = fdata, trace = TRUE)
##D coef(fit, matrix = TRUE)
## End(Not run)



