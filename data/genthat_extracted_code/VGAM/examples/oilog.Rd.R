library(VGAM)


### Name: oilog
### Title: One-inflated Logarithmic Distribution Family Function
### Aliases: oilog
### Keywords: models regression

### ** Examples

## Not run: 
##D  odata <- data.frame(x2 = runif(nn <- 1000))  # Artificial data
##D odata <- transform(odata, pstr1 = logit(-1 + x2, inverse = TRUE), shape = 0.5)
##D odata <- transform(odata, y1 = roilog(nn, shape, pstr1 = pstr1))
##D with(odata, table(y1))
##D fit1 <- vglm(y1 ~ x2, oilog(zero = "shape"), data = odata, trace = TRUE)
##D coef(fit1, matrix = TRUE)
## End(Not run)



