library(cocor)


### Name: cocor.dep.groups.overlap
### Title: Compare two overlapping correlations based on dependent groups
### Aliases: cocor.dep.groups.overlap

### ** Examples

# Compare the difference between the correlations (age, intelligence) and
# (age, shoe size) measured in the same group (all values are fictional):
r.jk <- .2  # Correlation (age, intelligence)
r.jh <- .5  # Correlation (age, shoe size)
r.kh <- .1  # Correlation (intelligence, shoe size)
n <- 315  # Size of the group

cocor.dep.groups.overlap(r.jk, r.jh, r.kh, n, var.labels=c("age", "intelligence",
      "shoe size"))




