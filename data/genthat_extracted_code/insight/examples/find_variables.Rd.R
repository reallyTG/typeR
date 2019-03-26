library(insight)


### Name: find_variables
### Title: Find names of all variables
### Aliases: find_variables

### ** Examples

library(lme4)
data(sleepstudy)
m <- lmer(
  log(Reaction) ~ Days + I(Days^2) + (1 + Days + exp(Days) | Subject),
  data = sleepstudy
)

find_variables(m)




