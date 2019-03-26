library(sjstats)


### Name: eta_sq
### Title: Effect size statistics for anova
### Aliases: eta_sq omega_sq cohens_f anova_stats

### ** Examples

# load sample data
data(efc)

# fit linear model
fit <- aov(
  c12hour ~ as.factor(e42dep) + as.factor(c172code) + c160age,
  data = efc
)

eta_sq(fit)
omega_sq(fit)
eta_sq(fit, partial = TRUE)
eta_sq(fit, partial = TRUE, ci.lvl = .8)

anova_stats(car::Anova(fit, type = 2))




