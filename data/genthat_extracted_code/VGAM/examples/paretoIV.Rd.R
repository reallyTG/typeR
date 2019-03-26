library(VGAM)


### Name: paretoIV
### Title: Pareto(IV/III/II) Distribution Family Functions
### Aliases: paretoIV paretoIII paretoII
### Keywords: models regression

### ** Examples

pdata <- data.frame(y = rparetoIV(2000, scale = exp(1),
                                  ineq = exp(-0.3), shape = exp(1)))
## Not run: 
##D par(mfrow = c(2, 1))
##D with(pdata, hist(y)); with(pdata, hist(log(y))) 
## End(Not run)
fit <- vglm(y ~ 1, paretoIV, data = pdata, trace = TRUE)
head(fitted(fit))
summary(pdata)
coef(fit, matrix = TRUE)
Coef(fit)
summary(fit)



