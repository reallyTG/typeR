library(confinterpret)


### Name: plot.interpretation_set
### Title: Plot a diagram of the valid options for an interpretation_set
###   object
### Aliases: plot.interpretation_set

### ** Examples

# Set a nice colour scheme
grDevices::palette(c("#FF671F99", "#F2A90099", "#0085CA99"))
# Plot the pre-defined interpretations_equivalence object with an additional
#   central boundary to illustrate where the actual null point is.
plot(interpretations_equivalence, extra_boundaries = c("Actual null" = 0))




