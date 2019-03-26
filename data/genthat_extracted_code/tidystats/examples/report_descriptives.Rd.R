library(tidystats)


### Name: report_descriptives
### Title: Report descriptives helper functions
### Aliases: report_descriptives M SD

### ** Examples

# Read in a list of results
descriptives <- read_stats(system.file("descriptives.csv",
  package = "tidystats"))

options(tidystats_list = descriptives)

# Report the mean
M("D4_avoidance")
M("D5_avoidance_anxiety", var = "avoidance")

# Report the standard deviation
SD("D4_avoidance")




