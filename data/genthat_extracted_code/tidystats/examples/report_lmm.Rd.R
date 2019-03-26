library(tidystats)


### Name: report_lmm
### Title: Report method for linear mixed models
### Aliases: report_lmm

### ** Examples

# Read in a list of results
results <- read_stats(system.file("results.csv", package = "tidystats"))

# Set the default results list
options(tidystats_list = results)

# Example: regression term
report("lme4_lme", term = "Days")
report("lmerTest_lme", term = "Days")




