library(Observation)


### Name: manual_tree_intensity
### Title: Manually Pre-Classify Activity Intensity
### Aliases: manual_tree_intensity
### Keywords: internal

### ** Examples

prompt_responses <- structure(c("yes", "no", NA, NA, NA, NA),
    .Dim = c(6L, 1L), .Dimnames = list(c("seated",
      "large_muscles_moving", "slow", "slowed_by_resistance",
      "ambulation", "light_walking"),
    "1"))

Observation:::manual_tree_intensity(prompt_responses)




