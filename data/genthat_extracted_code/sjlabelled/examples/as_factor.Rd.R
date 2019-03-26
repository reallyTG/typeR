library(sjlabelled)


### Name: as_factor
### Title: Convert variable into factor and keep value labels
### Aliases: as_factor

### ** Examples

library(sjmisc)
data(efc)
# normal factor conversion, loses value attributes
x <- as.factor(efc$e42dep)
frq(x)

# factor conversion, which keeps value attributes
x <- as_factor(efc$e42dep)
frq(x)

# create parially labelled vector
x <- set_labels(
  efc$e42dep,
  labels = c(
    `1` = "independent",
    `4` = "severe dependency",
    `9` = "missing value"
 ))

# only copy existing value labels
as_factor(x)
get_labels(as_factor(x), values = "p")

# also add labels to non-labelled values
as_factor(x, add.non.labelled = TRUE)
get_labels(as_factor(x, add.non.labelled = TRUE), values = "p")


# easily coerce specific variables in a data frame to factor
# and keep other variables, with their class preserved
as_factor(efc, e42dep, e16sex, c172code)

# use select-helpers from dplyr-package
library(dplyr)
as_factor(efc, contains("cop"), c161sex:c175empl)





