library(tidystats)


### Name: report_anova
### Title: Report method for ANOVA models
### Aliases: report_anova

### ** Examples

# Read in a list of results
results <- read_stats(system.file("results.csv", package = "tidystats"))

# Set the list as the default list
options(tidystats_list = results)

# Report results
report_anova("aov_two_way", term = "condition")
report_anova("aov_two_way", term = "sex")




