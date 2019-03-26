library(tidystats)


### Name: report_fisher
### Title: Report function for Fisher's Exact Tests for Count Data
### Aliases: report_fisher

### ** Examples

# Read in a list of results
results <- read_stats(system.file("results.csv", package = "tidystats"))

# Set the default tidystats list in options()
options(tidystats_list = results)

# Report results
report(identifier = "fisher_test")
report(identifier = "fisher_test_hybrid")
report(identifier = "fisher_test_simulated_p")




