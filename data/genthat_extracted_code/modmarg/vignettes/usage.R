## ------------------------------------------------------------------------
library(modmarg)
data(margex)

g <- glm(y ~ as.factor(agegroup)*as.factor(treatment) , data = margex)
summary(g)

## ------------------------------------------------------------------------
modmarg::marg(mod = g, var_interest = "treatment", type = 'levels')

## ------------------------------------------------------------------------
modmarg::marg(mod = g, var_interest = "treatment", type = "effects")

## ------------------------------------------------------------------------
g <- glm(y ~ poly(age, 3, raw = T) * as.factor(treatment) , data = margex)
summary(g)

modmarg::marg(mod = g, var_interest = "treatment", type = "effects",
              at = list("age" = c(20, 40, 60)))

## ------------------------------------------------------------------------
g <- glm(outcome ~ as.factor(treatment), data = margex, family = binomial)
summary(g)

## ------------------------------------------------------------------------
marg(mod = g, var_interest = "treatment", type = 'levels')
marg(mod = g, var_interest = "treatment", type = "effects")

## ------------------------------------------------------------------------
g <- glm(y ~ poly(distance, 2, raw = T) * as.factor(agegroup) , data = margex)
summary(g)

unique(margex$agegroup)
marg(mod = g, var_interest = "agegroup", type = 'levels',
          at_var_interest = c("20-29"))

## ------------------------------------------------------------------------
data(cvcov)
g <- glm(outcome ~ treatment + distance, data = margex, family = 'gaussian')
summary(g)
v <- cvcov$ols$clust
print(v)
d <- cvcov$ols$stata_dof
print(d)

# Without clustering
marg(mod = g, var_interest = "treatment", type = "levels")

# With clustering
marg(mod = g, var_interest = "treatment", type = "levels",
          vcov_mat = v, dof = d)

