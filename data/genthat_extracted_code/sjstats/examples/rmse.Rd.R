library(sjstats)


### Name: cv
### Title: Compute model quality
### Aliases: cv chisq_gof hoslem_gof rmse rse mse error_rate binned_resid

### ** Examples

data(efc)
fit <- lm(barthtot ~ c160age + c12hour, data = efc)
rmse(fit)
rse(fit)
cv(fit)

library(lme4)
fit <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
rmse(fit)
mse(fit)
cv(fit)

# normalized RMSE
library(nlme)
fit <- lme(distance ~ age, data = Orthodont)
rmse(fit, normalized = TRUE)

#coefficient of variation for variable
cv(efc$e17age)

# Error Rate
efc$neg_c_7d <- ifelse(efc$neg_c_7 < median(efc$neg_c_7, na.rm = TRUE), 0, 1)
m <- glm(
  neg_c_7d ~ c161sex + barthtot + c172code,
  data = efc,
  family = binomial(link = "logit")
)
error_rate(m)

# Binned residuals
binned_resid(m)
binned_resid(m, "barthtot")

# goodness-of-fit test for logistic regression
chisq_gof(m)

# goodness-of-fit test for logistic regression
hoslem_gof(m)

# goodness-of-fit test for vectors against probabilities
# differing from population
chisq_gof(efc$e42dep, c(0.3,0.2,0.22,0.28))
# equal to population
chisq_gof(efc$e42dep, prop.table(table(efc$e42dep)))





