library(groupedstats)


### Name: grouped_lmer
### Title: Function to run linear mixed-effects model (lmer) across
###   multiple grouping variables.
### Aliases: grouped_lmer

### ** Examples


# loading libraries containing data
library(ggplot2)
library(gapminder)

# getting tidy output of results
# let's use only 50% data to speed it up
groupedstats::grouped_lmer(
  data = dplyr::sample_frac(gapminder, size = 0.5),
  formula = scale(lifeExp) ~ scale(gdpPercap) + (gdpPercap | continent),
  grouping.vars = year,
  output = "tidy"
)

# getting model summaries
# let's use only 50% data to speed it up
grouped_lmer(
  data = ggplot2::diamonds,
  formula = scale(price) ~ scale(carat) + (carat | color),
  REML = FALSE,
  grouping.vars = c(cut, clarity),
  output = "glance"
)



