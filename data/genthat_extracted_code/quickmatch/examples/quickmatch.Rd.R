library(quickmatch)


### Name: quickmatch
### Title: Derive generalized full matchings
### Aliases: quickmatch

### ** Examples

# Construct example data
my_data <- data.frame(y = rnorm(100),
                      x1 = runif(100),
                      x2 = runif(100),
                      treatment = factor(sample(rep(c("T1", "T2", "C"), c(25, 25, 50)))))

# Make distances
my_distances <- distances(my_data, dist_variables = c("x1", "x2"))

# Make matching with one unit from "T1", "T2" and "C" in each matched group
quickmatch(my_distances, my_data$treatment)

# Require at least two "C" in each group
quickmatch(my_distances,
           my_data$treatment,
           treatment_constraints = c("T1" = 1, "T2" = 1, "C" = 2))

# Require groups with at least six units in total
quickmatch(my_distances,
           my_data$treatment,
           treatment_constraints = c("T1" = 1, "T2" = 1, "C" = 2),
           size_constraint = 6)

# Focus the matching to units assigned to "T1" and "T2" (i.e., all
# units assigned to "T1" or T2 will be assigned to a matched group).
# Units assigned to treatment "C" will be assigned to groups so to
# ensure that each group contains at least one unit of each treatment
# condition. Remaining "C" units could be left unassigned.
quickmatch(my_distances,
           my_data$treatment,
           target = c("T1", "T2"))

# Impose caliper
quickmatch(my_distances,
           my_data$treatment,
           caliper = 0.25)

# Call `quickmatch` directly with covariate data (ie., not pre-calculating distances)
quickmatch(my_data[c("x1", "x2")], my_data$treatment)

# Call `quickmatch` directly with covariate data using Mahalanobis distances
quickmatch(my_data[c("x1", "x2")],
           my_data$treatment,
           normalize = "mahalanobize")




