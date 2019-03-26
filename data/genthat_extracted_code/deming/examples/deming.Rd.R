library(deming)


### Name: deming
### Title: Fit a generalized Deming regression
### Aliases: deming
### Keywords: models, regression

### ** Examples

# Data from Ripley and Thompson
fit <- deming(aes ~ aas, data=arsenate, xstd=se.aas, ystd=se.aes)
print(fit)
## Not run: 
##D             Coef se(coef) lower 0.95 upper 0.95
##D Intercept 0.1064   0.2477    -0.3790     0.5919
##D Slope     0.9730   0.1430     0.6928     1.2532
##D 
##D    Scale= 1.358 
## End(Not run)
plot(1:30, fit$dfbeta[,2]) #subject 22 has a large effect on the slope

# Constant proportional error fit (constant CV)
fit2 <- deming(new.lot ~ old.lot, ferritin, cv=TRUE,
                subset=(period==3))



