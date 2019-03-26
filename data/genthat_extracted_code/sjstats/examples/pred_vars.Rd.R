library(sjstats)


### Name: pred_vars
### Title: Access information from model objects
### Aliases: pred_vars resp_var re_grp_var grp_var resp_val link_inverse
###   model_frame model_family var_names

### ** Examples

data(efc)
fit <- lm(neg_c_7 ~ e42dep + c161sex, data = efc)

pred_vars(fit)
resp_var(fit)
resp_val(fit)

link_inverse(fit)(2.3)

# example from ?stats::glm
counts <- c(18, 17, 15, 20, 10, 20, 25, 13, 12)
outcome <- gl(3, 1, 9)
treatment <- gl(3, 3)
m <- glm(counts ~ outcome + treatment, family = poisson())

link_inverse(m)(.3)
# same as
exp(.3)

outcome <- as.numeric(outcome)
m <- glm(counts ~ log(outcome) + as.factor(treatment), family = poisson())
var_names(m)

# model.frame and model_frame behave slightly different
library(splines)
m <- lm(neg_c_7 ~ e42dep + ns(c160age, knots = 2), data = efc)
head(model.frame(m))
head(model_frame(m))

library(lme4)
data(cbpp)
cbpp$trials <- cbpp$size - cbpp$incidence
m <- glm(cbind(incidence, trials) ~ period, data = cbpp, family = binomial)
head(model.frame(m))
head(model_frame(m))

resp_var(m, combine = TRUE)
resp_var(m, combine = FALSE)

# get random effects grouping factor from mixed models
library(lme4)
data(sleepstudy)
m <- lmer(Reaction ~ Days + (1 + Days | Subject), data = sleepstudy)
re_grp_var(m)

# get model predictors, with and w/o dispersion formula
## Not run: 
##D library(glmmTMB)
##D data("Salamanders")
##D m <- glmmTMB(
##D   count ~ spp + cover + mined + poly(DOP, 3) + (1 | site),
##D   ziformula = ~spp + mined,
##D   dispformula = ~DOY,
##D   data = Salamanders,
##D   family = nbinom2
##D )
##D 
##D pred_vars(m)
##D pred_vars(m, fe.only = TRUE)
##D pred_vars(m, disp = TRUE)
## End(Not run)




