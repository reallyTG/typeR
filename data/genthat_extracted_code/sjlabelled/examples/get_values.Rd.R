library(sjlabelled)


### Name: get_values
### Title: Retrieve values of labelled variables
### Aliases: get_values

### ** Examples

data(efc)
str(efc$e42dep)
get_values(efc$e42dep)
get_labels(efc$e42dep)

library(haven)
x <- labelled(c(1:3, tagged_na("a", "c", "z"), 4:1),
              c("Agreement" = 1, "Disagreement" = 4, "First" = tagged_na("c"),
                "Refused" = tagged_na("a"), "Not home" = tagged_na("z")))
# get all values
get_values(x)
# drop NA
get_values(x, drop.na = TRUE)

# data frame as input
y <- labelled(c(2:3, 3:1, tagged_na("y"), 4:1),
              c("Agreement" = 1, "Disagreement" = 4, "Why" = tagged_na("y")))
get_values(data.frame(x, y))




