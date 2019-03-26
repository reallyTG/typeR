library(segregation)


### Name: mutual_difference
### Title: Decomposes the difference between two M indices
### Aliases: mutual_difference

### ** Examples

# decompose the difference in school segregation between 2000 and 2005,
# using the Shapley method
mutual_difference(schools00, schools05, group = "race", unit = "school",
    weight = "n", method = "shapley", precision = .1)
# => the structural component is close to zero, thus most change is in the marginals.
# This method gives identical results when we switch the unit and group definitions,
# and when we switch the data inputs.

# the Karmel-Maclachlan method is similar, but only adjust the data in the forward direction...
mutual_difference(schools00, schools05, group = "school", unit = "race",
    weight = "n", method = "km", precision = .1)

# ...this means that the results won't be identical when we switch the data inputs
mutual_difference(schools05, schools00, group = "school", unit = "race",
    weight = "n", method = "km", precision = .1)

# the MRC method indicates a much higher structural change...
mutual_difference(schools00, schools05, group = "race", unit = "school",
    weight = "n", method = "mrc")

# ...and is not symmetric
mutual_difference(schools00, schools05, group = "school", unit = "race",
    weight = "n", method = "mrc")



