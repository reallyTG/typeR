library(VGAM)


### Name: constraints
### Title: Constraint Matrices
### Aliases: constraints constraints.vlm
### Keywords: models regression

### ** Examples

# Fit the proportional odds model:
pneumo <- transform(pneumo, let = log(exposure.time))
(fit1 <- vglm(cbind(normal, mild, severe) ~ sm.bs(let, 3),
              cumulative(parallel = TRUE, reverse = TRUE), data = pneumo))
coef(fit1, matrix = TRUE)
constraints(fit1)  # Parallel assumption results in this
constraints(fit1, type = "term")  # Same as the default ("vlm"-type)
is.parallel(fit1)

# An equivalent model to fit1 (needs the type "term" constraints):
clist.term <- constraints(fit1, type = "term")  # "term"-type constraints
(fit2 <- vglm(cbind(normal, mild, severe) ~ sm.bs(let, 3), data = pneumo,
              cumulative(reverse = TRUE), constraints = clist.term))
abs(max(coef(fit1, matrix = TRUE) -
        coef(fit2, matrix = TRUE)))  # Should be zero

# Fit a rank-1 stereotype (RR-multinomial logit) model:
fit <- rrvglm(Country ~ Width + Height + HP, multinomial, data = car.all)
constraints(fit)  # All except the first are the estimated A matrix



