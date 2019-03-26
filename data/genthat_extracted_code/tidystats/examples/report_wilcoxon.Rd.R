library(tidystats)


### Name: report_wilcoxon
### Title: Report function for Wilcoxon Rank Sum and Signed Rank Tests
### Aliases: report_wilcoxon

### ** Examples

# Read in a list of results
results <- read_stats(system.file("results.csv", package = "tidystats"))

# Set the default tidystats list in options()
options(tidystats_list = results)

# Report results
report(identifier = "wilcoxon_rank_sum")
report(identifier = "wilcoxon_signed_rank")




