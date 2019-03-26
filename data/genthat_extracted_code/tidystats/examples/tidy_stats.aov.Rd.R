library(tidystats)


### Name: tidy_stats.aov
### Title: Create a tidy stats data frame from an aov object
### Aliases: tidy_stats.aov

### ** Examples

# Conduct an ANOVA
model_aov <- aov(yield ~ block + N * P * K, npk)

# Tidy stats
tidy_stats(model_aov)




