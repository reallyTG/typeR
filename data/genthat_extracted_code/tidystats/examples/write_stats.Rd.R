library(tidystats)


### Name: write_stats
### Title: Save the results in a tidy stats list to a .csv file
### Aliases: write_stats

### ** Examples

library(dplyr)

# Create an empty list to store the results in
results <- list()

# Conduct statistical tests
model1 <- t.test(anxiety ~ condition, data = cox)
model2 <- cor.test(cox$anxiety, cox$avoidance)

# Add output to the results list
results <- results %>%
  add_stats(model1, identifier = "M1") %>%
  add_stats(model2, identifier = "M2")

# Save the results
dir <- tempdir()
write_stats(results, file.path(dir, "results.txt"))




