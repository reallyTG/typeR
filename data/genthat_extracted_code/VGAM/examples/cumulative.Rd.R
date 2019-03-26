library(VGAM)


### Name: cumulative
### Title: Ordinal Regression with Cumulative Probabilities
### Aliases: cumulative
### Keywords: models regression

### ** Examples

# Fit the proportional odds model, p.179, in McCullagh and Nelder (1989)
pneumo <- transform(pneumo, let = log(exposure.time))
(fit <- vglm(cbind(normal, mild, severe) ~ let,
             cumulative(parallel = TRUE, reverse = TRUE), data = pneumo))
depvar(fit)  # Sample proportions (good technique)
fit@y        # Sample proportions (bad technique)
weights(fit, type = "prior")  # Number of observations
coef(fit, matrix = TRUE)
constraints(fit)  # Constraint matrices
apply(fitted(fit), 1, which.max)  # Classification
apply(predict(fit, newdata = pneumo, type = "response"),
      1, which.max)  # Classification
R2latvar(fit)

# Check that the model is linear in let ----------------------
fit2 <- vgam(cbind(normal, mild, severe) ~ s(let, df = 2),
             cumulative(reverse = TRUE), data = pneumo)
## Not run:  plot(fit2, se = TRUE, overlay = TRUE, lcol = 1:2, scol = 1:2) 

# Check the proportional odds assumption with a LRT ----------
(fit3 <- vglm(cbind(normal, mild, severe) ~ let,
              cumulative(parallel = FALSE, reverse = TRUE), data = pneumo))
pchisq(2 * (logLik(fit3) - logLik(fit)),
       df = length(coef(fit3)) - length(coef(fit)), lower.tail = FALSE)
lrtest(fit3, fit)  # More elegant

# A factor() version of fit ----------------------------------
# This is in long format (cf. wide format above)
Nobs <- round(depvar(fit) * c(weights(fit, type = "prior")))
sumNobs <- colSums(Nobs)  # apply(Nobs, 2, sum)

pneumo.long <-
  data.frame(symptoms = ordered(rep(rep(colnames(Nobs), nrow(Nobs)),
                                        times = c(t(Nobs))),
                                levels = colnames(Nobs)),
             let = rep(rep(with(pneumo, let), each = ncol(Nobs)),
                       times = c(t(Nobs))))
with(pneumo.long, table(let, symptoms))  # Should be same as pneumo


(fit.long1 <- vglm(symptoms ~ let, data = pneumo.long, trace = TRUE,
                   cumulative(parallel = TRUE, reverse = TRUE)))
coef(fit.long1, matrix = TRUE)  # Should be as coef(fit, matrix = TRUE)
# Could try using mustart if fit.long1 failed to converge.
mymustart <- matrix(sumNobs / sum(sumNobs),
                    nrow(pneumo.long), ncol(Nobs), byrow = TRUE)
fit.long2 <- vglm(symptoms ~ let, mustart = mymustart,
                  cumulative(parallel = TRUE, reverse = TRUE),
                  data = pneumo.long, trace = TRUE)
coef(fit.long2, matrix = TRUE)  # Should be as coef(fit, matrix = TRUE)



