library(segregation)


### Name: mutual_within
### Title: Calculate detailed within-category segregation scores for M and
###   H
### Aliases: mutual_within

### ** Examples

(within <- mutual_within(schools00, "race", "school", within = "state",
                         weight = "n", wide = TRUE))
# the M for "AL" is .409
# manual calculation
schools_AL <- schools00[schools00$state=="AL",]
mutual_total(schools_AL, "race", "school", weight = "n") # M => .409

# to recover the within M and H from the output, multiply
# p * M and h_weight * H, respectively
sum(within$p * within$M) # => .326
sum(within$H * within$h_weight) # => .321
# compare with:
mutual_total(schools00, "race", "school", within = "state", weight = "n")



