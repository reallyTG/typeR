library(tidystats)


### Name: report
### Title: Report function
### Aliases: report

### ** Examples

# Read in a list of results
results <- read_stats(system.file("results.csv", package = "tidystats"))

# Set the list as the default list
options(tidystats_list = results)

# Example: t-test
report("t_test_one_sample")
report("t_test_welch")

# Example: correlation
report("correlation_pearson")
report("correlation_spearman")

# Example: ANOVA
report("aov_two_way", term = "condition")
report("aov_two_way", term = "sex")

# Example: Linear models
report("lm_simple", term = "conditionmortality salience")
report("lm_simple", term_nr = 2)
report("lm_simple", group = "model")




