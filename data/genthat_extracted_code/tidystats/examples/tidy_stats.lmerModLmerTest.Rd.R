library(tidystats)


### Name: tidy_stats.lmerModLmerTest
### Title: Create a tidy stats data frame from an lmerModLmerTest object
### Aliases: tidy_stats.lmerModLmerTest

### ** Examples

## No test: 
  # Load packages
  library(lme4)
  library(lmerTest)

  # Conduct a linear mixed model
  model_lmerTest <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)

  # Tidy stats
  tidy_stats(model_lmerTest)
## End(No test)




