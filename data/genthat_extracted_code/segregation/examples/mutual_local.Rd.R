library(segregation)


### Name: mutual_local
### Title: Calculates local segregation indices based on M
### Aliases: mutual_local

### ** Examples

# which racial groups are most segregated?
(localseg = mutual_local(schools00, "school", "race",
                         weight="n", wide = TRUE))

sum(localseg$p) # => 1

# the sum of the weighted local segregation scores equals
# total segregation
sum(localseg$ls * localseg$p) # => .425
mutual_total(schools00, "school", "race", weight="n") # M => .425



