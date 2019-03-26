library(VGAM)


### Name: posbernoulli.tb
### Title: Positive Bernoulli Family Function with Time and Behavioural
###   Effects
### Aliases: posbernoulli.tb
### Keywords: models regression

### ** Examples

## Not run: 
##D # Example 1: simulated data
##D nTimePts <- 5  # (aka tau == # of sampling occasions)
##D nnn <- 1000   # Number of animals
##D pdata <- rposbern(n = nnn, nTimePts = nTimePts, pvars = 2)
##D dim(pdata); head(pdata)
##D 
##D M_tbh.1 <- vglm(cbind(y1, y2, y3, y4, y5) ~ x2,
##D                 posbernoulli.tb, data = pdata, trace = TRUE)
##D coef(M_tbh.1)  # First element is the behavioural effect
##D coef(M_tbh.1, matrix = TRUE)
##D constraints(M_tbh.1, matrix = TRUE)
##D summary(M_tbh.1, presid = FALSE)  # Standard errors are approximate
##D head(fitted(M_tbh.1))
##D head(model.matrix(M_tbh.1, type = "vlm"), 21)
##D dim(depvar(M_tbh.1))
##D 
##D M_tbh.2 <- vglm(cbind(y1, y2, y3, y4, y5) ~ x2,
##D                 posbernoulli.tb(parallel.t = FALSE ~  0),
##D                 data = pdata, trace = TRUE)
##D coef(M_tbh.2)  # First element is the behavioural effect
##D coef(M_tbh.2, matrix = TRUE)
##D constraints(M_tbh.2, matrix = TRUE)
##D summary(M_tbh.2, presid = FALSE)  # Standard errors are approximate
##D head(fitted(M_tbh.2))
##D head(model.matrix(M_tbh.2, type = "vlm"), 21)
##D dim(depvar(M_tbh.2))
##D 
##D # Example 2: deermice subset data
##D fit1 <- vglm(cbind(y1, y2, y3, y4, y5, y6) ~ sex + weight,
##D              posbernoulli.t, data = deermice, trace = TRUE)
##D coef(fit1)
##D coef(fit1, matrix = TRUE)
##D constraints(fit1, matrix = TRUE)
##D summary(fit1, presid = FALSE)  # Standard errors are approximate
##D 
##D # fit1 is the same as Fit1 (a M_{th} model):
##D Fit1 <- vglm(cbind(y1, y2, y3, y4, y5, y6) ~ sex + weight,
##D              posbernoulli.tb(drop.b = TRUE ~ sex + weight,
##D                              parallel.t = TRUE),  # No parallelism for the intercept
##D              data = deermice, trace = TRUE)
##D constraints(Fit1)
## End(Not run)



