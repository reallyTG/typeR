library(mice)


### Name: pool.compare
### Title: Compare two nested models fitted to imputed data
### Aliases: pool.compare
### Keywords: htest

### ** Examples


### To compare two linear models:
imp <- mice(nhanes2, seed = 51009, print = FALSE)
mi1 <- with(data = imp, expr = lm(bmi ~ age + hyp + chl))
mi0 <- with(data = imp, expr = lm(bmi ~ age + hyp))
pc  <- pool.compare(mi1, mi0)
pc$pvalue

### Comparison of two general linear models (logistic regression).
## Not run: 
##D imp  <- mice(boys, maxit = 2, print = FALSE)
##D fit1 <- with(imp, glm(gen > levels(gen)[1] ~ hgt + hc + reg, family = binomial))
##D fit0 <- with(imp, glm(gen > levels(gen)[1] ~ hgt + hc, family = binomial))
##D pool.compare(fit1, fit0, method = 'likelihood')$pvalue
##D 
##D # using factors
##D fit1 <- with(imp, glm(as.factor(gen > levels(gen)[1]) ~ hgt + hc + reg, family = binomial))
##D fit0 <- with(imp, glm(as.factor(gen > levels(gen)[1]) ~ hgt + hc, family = binomial))
##D pool.compare(fit1, fit0, method = 'likelihood')$pvalue
## End(Not run)



