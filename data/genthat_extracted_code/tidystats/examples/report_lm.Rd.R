library(tidystats)


### Name: report_lm
### Title: Report method for linear regression models
### Aliases: report_lm

### ** Examples

# Read in a list of results
results <- read_stats(system.file("results.csv", package = "tidystats"))

# Set the default results list
options(tidystats_list = results)

# Report results
report("lm_simple", term = "conditionmortality salience")
report("lm_simple", term_nr = 2)
report("lm_simple", group = "model")




