library(sjmisc)


### Name: frq
### Title: Frequency table of labelled variables
### Aliases: frq

### ** Examples

# simple vector
data(efc)
frq(efc$e42dep)

# with grouped data frames, in a pipe
library(dplyr)
efc %>%
  group_by(e16sex, c172code) %>%
  frq(e16sex, c172code, e42dep)

# with select-helpers: all variables from the COPE-Index
# (which all have a "cop" in their name)
frq(efc, contains("cop"))

# all variables from column "c161sex" to column "c175empl"
frq(efc, c161sex:c175empl)

# for non-labelled data, variable name is printed,
# and "label" column is removed from output
data(iris)
frq(iris, Species)

# group variables with large range and with weights
efc$weights <- abs(rnorm(n = nrow(efc), mean = 1, sd = .5))
frq(efc, c160age, auto.grp = 5, weights = weights)

# different weight options
frq(efc, c172code, weights = weights)
frq(efc, c172code, weights = "weights")
frq(efc, c172code, weights = efc$weights)
frq(efc$c172code, weights = efc$weights)

# group string values
dummy <- efc[1:50, 3, drop = FALSE]
dummy$words <- sample(
  c("Hello", "Helo", "Hole", "Apple", "Ape",
    "New", "Old", "System", "Systemic"),
  size = nrow(dummy),
  replace = TRUE
)

frq(dummy)
frq(dummy, grp.strings = 2)




