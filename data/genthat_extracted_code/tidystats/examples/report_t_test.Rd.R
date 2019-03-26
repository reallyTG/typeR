library(tidystats)


### Name: report_t_test
### Title: Report function for t-tests
### Aliases: report_t_test

### ** Examples

# Read in a list of results
results <- read_stats(system.file("results.csv", package = "tidystats"))

# Set the default tidystats list in options()
options(tidystats_list = results)

# Report results
report(identifier = "t_test_one_sample")
report(identifier = "t_test_two_sample")
report(identifier = "t_test_welch")
report(identifier = "t_test_paired")




