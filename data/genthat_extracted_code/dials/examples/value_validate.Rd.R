library(dials)


### Name: value_validate
### Title: Tools for working with parameter values
### Aliases: value_validate value_seq value_sample value_transform
###   value_inverse value_set

### ** Examples

library(dplyr)

penalty %>% value_set(-4:-1)

# Is a specific value valid?
penalty
penalty %>% range_get()
value_validate(penalty, 17)

# get a sequence of values
Cp
Cp %>% value_seq(4)
Cp %>% value_seq(4, original = FALSE)

on_log_scale <- Cp %>% value_seq(4, original = FALSE)
nat_units <- value_inverse(Cp, on_log_scale)
nat_units
value_transform(Cp, nat_units)

# random values in the range
set.seed(3666)
Cp %>% value_sample(2)





