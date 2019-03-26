library(tidystats)


### Name: report_glm
### Title: Report method for generalized linear models
### Aliases: report_glm

### ** Examples

# Read in a list of results
results <- read_stats(system.file("results.csv", package = "tidystats"))

# Set the default results list
options(tidystats_list = results)

# Report results
report("glm_gaussian", term = "Prewt")
report("glm_gamma", term = "log(u)")
report("glm_poisson", term_nr = 2)




