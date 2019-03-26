library(tidystats)


### Name: report_chi_squared
### Title: Report function for a chi-squared test
### Aliases: report_chi_squared

### ** Examples

# Read in a list of results
results <- read_stats(system.file("results.csv", package = "tidystats"))

# Set the default tidystats list in options()
options(tidystats_list = results)

# Report results
report(identifier = "chi_squared")
report(identifier = "chi_squared_yates")




