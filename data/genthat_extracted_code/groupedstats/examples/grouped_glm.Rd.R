library(groupedstats)


### Name: grouped_glm
### Title: Function to run generalized linear model (glm) across multiple
###   grouping variables.
### Aliases: grouped_glm

### ** Examples


# to get tidy output
groupedstats::grouped_glm(
  data = groupedstats::Titanic_full,
  formula = Survived ~ Sex,
  grouping.vars = Class,
  family = stats::binomial(link = "logit")
)

# to get glance output
groupedstats::grouped_glm(
  data = groupedstats::Titanic_full,
  formula = Survived ~ Sex,
  grouping.vars = Class,
  family = stats::binomial(link = "logit"),
  output = "glance"
)



