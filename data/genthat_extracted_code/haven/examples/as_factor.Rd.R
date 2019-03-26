library(haven)


### Name: as_factor
### Title: Convert input to a factor.
### Aliases: as_factor as_factor.data.frame as_factor.haven_labelled

### ** Examples

x <- labelled(sample(5, 10, replace = TRUE), c(Bad = 1, Good = 5))

# Default method uses values where available
as_factor(x)
# You can also extract just the labels
as_factor(x, "labels")
# Or just the values
as_factor(x, "values")
# Or combine value and label
as_factor(x, "both")



