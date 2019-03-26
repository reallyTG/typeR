library(sjPlot)


### Name: plot_model
### Title: Plot regression models
### Aliases: plot_model get_model_data

### ** Examples

# prepare data
library(sjmisc)
data(efc)
efc <- to_factor(efc, c161sex, e42dep, c172code)
m <- lm(neg_c_7 ~ pos_v_4 + c12hour + e42dep + c172code, data = efc)

# simple forest plot
plot_model(m)

# grouped coefficients
plot_model(m, group.terms = c(1, 2, 3, 3, 3, 4, 4))

# keep only selected terms in the model: pos_v_4, the
# levels 3 and 4 of factor e42dep and levels 2 and 3 for c172code
plot_model(m, terms = c("pos_v_4", "e42dep [3,4]", "c172code [2,3]"))

# multiple plots, as returned from "diagnostic"-plot type,
# can be arranged with 'plot_grid()'
## Not run: 
##D p <- plot_model(m, type = "diag")
##D plot_grid(p)
## End(Not run)

# plot random effects
library(lme4)
m <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
plot_model(m, type = "re")

# plot marginal effects
plot_model(m, type = "pred", terms = "Days")

# plot interactions
## Not run: 
##D m <- glm(
##D   tot_sc_e ~ c161sex + c172code * neg_c_7,
##D   data = efc,
##D   family = poisson()
##D )
##D # type = "int" automatically selects groups for continuous moderator
##D # variables - see argument 'mdrt.values'. The following function call is
##D # identical to:
##D # plot_model(m, type = "pred", terms = c("c172code", "neg_c_7 [7,28]"))
##D plot_model(m, type = "int")
##D 
##D # switch moderator
##D plot_model(m, type = "pred", terms = c("neg_c_7", "c172code"))
##D # same as
##D # ggeffects::ggpredict(m, terms = c("neg_c_7", "c172code"))
## End(Not run)

# plot Stan-model
## Not run: 
##D if (require("rstanarm")) {
##D   data(mtcars)
##D   m <- stan_glm(mpg ~ wt + am + cyl + gear, data = mtcars, chains = 1)
##D   plot_model(m, bpe.style = "dot")
##D }
## End(Not run)




