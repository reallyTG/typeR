library(VGAM)


### Name: oizipf
### Title: One-inflated Zipf Distribution Family Function
### Aliases: oizipf
### Keywords: models regression

### ** Examples

## Not run: 
##D  odata <- data.frame(x2 = runif(nn <- 1000))  # Artificial data
##D odata <- transform(odata, pstr1 = logit(-1 + x2, inverse = TRUE),
##D                           myN   = 10,
##D                           shape = exp(-0.5))
##D odata <- transform(odata, y1 = roizipf(nn, N = myN, s = shape, pstr1 = pstr1))
##D with(odata, table(y1))
##D fit1 <- vglm(y1 ~ x2, oizipf(zero = "shape"), data = odata, trace = TRUE)
##D coef(fit1, matrix = TRUE)
## End(Not run)



