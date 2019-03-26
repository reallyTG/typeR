library(tidystats)


### Name: tidy_stats.aovlist
### Title: Create a tidy stats data frame from an aovlist object
### Aliases: tidy_stats.aovlist

### ** Examples

# Conduct a within-subjects ANOVA
model_aov_within <- aov(extra ~ group + Error(ID/group), data = sleep)

# Tidy stats
tidy_stats(model_aov_within)




