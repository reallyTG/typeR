library(assertive.sets)


### Name: assert_are_disjoint_sets
### Title: Set comparisons
### Aliases: are_disjoint_sets are_intersecting_sets are_set_equal
###   assert_are_disjoint_sets assert_are_intersecting_sets
###   assert_are_set_equal assert_is_set_equal assert_is_subset
###   assert_is_superset is_set_equal is_subset is_superset

### ** Examples

# Same contents, different order, returns TRUE
are_set_equal(1:5, 5:1)

# Different lengths
are_set_equal(1:5, 1:6)

# First vector contains values not in second vector
are_set_equal(1:5, c(1:4, 4))

# Second vector contains values not in first vector
are_set_equal(c(1:4, 4), 1:5)

# Is x a subset of y?
is_subset(1:4, 1:5)
is_subset(1:5, 1:4)

# Is x a superset of y?
is_superset(1:5, 1:4)
is_superset(1:4, 1:5)

# The strictly argument checks for a strict sub/superset
is_subset(1:5, 1:5, strictly = TRUE)
is_superset(1:5, 1:5, strictly = TRUE)

# Do x and y have common elements?
are_intersecting_sets(1:4, 3:6)
are_disjoint_sets(1:4, 3:6)

# Types are coerced to be the same, as per base::setdiff
are_set_equal(1:4, c("4", "3", "2", "1"))

# Errors are thrown in the event of failure
assert_are_set_equal(1:5, 5:1)
assertive.base::dont_stop(assert_are_set_equal(1:5, 1:6))

assert_is_subset(1:4, 1:5)
assertive.base::dont_stop(assert_is_subset(1:5, 1:4))

assert_is_superset(1:5, 1:4)
assertive.base::dont_stop(assert_is_superset(1:4, 1:5))

# A common use case: checking that data contains required columns
required_cols <- c("Time", "weight", "Diet")
assert_is_superset(colnames(ChickWeight), required_cols)



