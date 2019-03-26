library(emmeans)


### Name: nutrition
### Title: Nutrition data
### Aliases: nutrition
### Keywords: datasets

### ** Examples

nutr.aov <- aov(gain ~ (group + age + race)^2, data = nutrition)

# Summarize predictions for age group 3
nutr.emm <- emmeans(nutr.aov, ~ race * group, at = list(age="3"))
                   
emmip(nutr.emm, race ~ group)

# Hispanics seem exceptional; but this doesn't test out due to very sparse data
CLD(nutr.emm, by = "group")
CLD(nutr.emm, by = "race")



