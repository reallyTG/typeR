library(tidystats)


### Name: report_correlation
### Title: Report function for correlations
### Aliases: report_correlation

### ** Examples

# Read in a list of results
results <- read_stats(system.file("results.csv", package = "tidystats"))

# Set the default tidystats list in options()
options(tidystats_list = results)

# Report results
report(identifier = "correlation_pearson")
report(identifier = "correlation_spearman")
report(identifier = "correlation_kendall")




