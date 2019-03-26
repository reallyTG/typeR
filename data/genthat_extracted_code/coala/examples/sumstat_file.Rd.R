library(coala)


### Name: sumstat_file
### Title: Summary Statistic: Files
### Aliases: sumstat_file

### ** Examples

folder <- tempfile("coala-test")
model <- coal_model(10, 1) +
  feat_mutation(5) +
  sumstat_file(folder)
simulate(model)$file

unlink(folder, recursive = TRUE)  # Clean up



