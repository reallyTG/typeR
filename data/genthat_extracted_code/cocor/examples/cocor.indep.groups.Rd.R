library(cocor)


### Name: cocor.indep.groups
### Title: Compare two correlations based on independent groups
### Aliases: cocor.indep.groups

### ** Examples

# Compare the difference between two correlations based
# on two independent groups:
r1.jk <- .7  # Correlation between age and intelligence measured in group 1
n1 <- 305    # Size of group 1

r2.hm <- .6  # Correlation between age and intelligence measured in group 2
n2 <- 210    # Size of group 2

cocor.indep.groups(r1.jk, r2.hm, n1, n2, data.name=c("group1", "group2"),
      var.labels=c("age", "intelligence", "age", "intelligence"))




