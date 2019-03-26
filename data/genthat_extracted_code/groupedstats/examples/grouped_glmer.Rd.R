library(groupedstats)


### Name: grouped_glmer
### Title: Function to run generalized linear mixed-effects model (glmer)
###   across multiple grouping variables.
### Aliases: grouped_glmer

### ** Examples


# commented out because the examples are time-consuming and the R CMD CHECK
# makes a NOTE (> 5s)

# categorical outcome; binomial family
groupedstats::grouped_glmer(
  formula = Survived ~ Age + (Age |
    Class),
  family = stats::binomial(link = "probit"),
  data = dplyr::sample_frac(groupedstats::Titanic_full, size = 0.3),
  grouping.vars = Sex
)

# continuous outcome; gaussian family
library(gapminder)

groupedstats::grouped_glmer(
  data = dplyr::sample_frac(gapminder, size = 0.3),
  formula = scale(lifeExp) ~ scale(gdpPercap) + (gdpPercap | continent),
  family = stats::gaussian(),
  control = lme4::lmerControl(
    optimizer = "bobyqa",
    restart_edge = TRUE,
    boundary.tol = 1e-7,
    calc.derivs = FALSE,
    optCtrl = list(maxfun = 2e9)
  ),
  grouping.vars = year,
  output = "tidy"
)



