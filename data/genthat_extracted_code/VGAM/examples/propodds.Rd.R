library(VGAM)


### Name: propodds
### Title: Proportional Odds Model for Ordinal Regression
### Aliases: propodds
### Keywords: models regression

### ** Examples

# Fit the proportional odds model, p.179, in McCullagh and Nelder (1989)
pneumo <- transform(pneumo, let = log(exposure.time))
(fit <- vglm(cbind(normal, mild, severe) ~ let, propodds, data = pneumo))
depvar(fit)  # Sample proportions
weights(fit, type = "prior")  # Number of observations
coef(fit, matrix = TRUE)
constraints(fit)  # Constraint matrices
summary(fit)

# Check that the model is linear in let ----------------------
fit2 <- vgam(cbind(normal, mild, severe) ~ s(let, df = 2), propodds, data = pneumo)
## Not run:  plot(fit2, se = TRUE, lcol = 2, scol = 2) 

# Check the proportional odds assumption with a LRT ----------
(fit3 <- vglm(cbind(normal, mild, severe) ~ let,
              cumulative(parallel = FALSE, reverse = TRUE), data = pneumo))
pchisq(deviance(fit) - deviance(fit3),
       df = df.residual(fit) - df.residual(fit3), lower.tail = FALSE)
lrtest(fit3, fit)  # Easier



