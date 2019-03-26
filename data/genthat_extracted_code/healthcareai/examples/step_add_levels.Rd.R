library(healthcareai)


### Name: step_add_levels
### Title: Add levels to nominal variables
### Aliases: step_add_levels tidy.step_add_levels

### ** Examples

library(recipes)
d <- data.frame(num = 1:30,
                has_missing = c(rep(NA, 10), rep('b', 20)),
                has_rare = c("rare", rep("common", 29)),
                has_both = c("rare", NA, rep("common", 28)),
                has_neither = c(rep("cat1", 15), rep("cat2", 15)))
rec <- recipe( ~ ., d) %>%
  step_add_levels(all_nominal()) %>%
  prep(training = d)
baked <- bake(rec, d)
lapply(d[, sapply(d, is.factor)], levels)
lapply(baked[, sapply(baked, is.factor)], levels)



