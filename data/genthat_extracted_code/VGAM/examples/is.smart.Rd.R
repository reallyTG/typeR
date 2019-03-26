library(VGAM)


### Name: is.smart
### Title: Test For a Smart Object
### Aliases: is.smart
### Keywords: models regression programming

### ** Examples

is.smart(sm.min1)  # TRUE
is.smart(sm.poly)  # TRUE
library(splines)
is.smart(sm.bs)  # TRUE
is.smart(sm.ns)  # TRUE
is.smart(tan)  # FALSE
## Not run: 
##D udata <- data.frame(x2 = rnorm(9))
##D fit1 <- vglm(rnorm(9) ~ x2, uninormal, data = udata)
##D is.smart(fit1)  # TRUE
##D fit2 <- vglm(rnorm(9) ~ x2, uninormal, data = udata, smart = FALSE)
##D is.smart(fit2)  # FALSE
##D fit2@smart.prediction
## End(Not run)



