library(tidystats)


### Name: tidy_stats.lmerMod
### Title: Create a tidy stats data frame from an lmerMod object
### Aliases: tidy_stats.lmerMod

### ** Examples

## No test: 
  # Load package
  library(lme4)

  # Conduct a linear mixed model
  model_lmer <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)

  # Tidy stats
  tidy_stats(model_lmer)
## End(No test)




