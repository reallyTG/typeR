library(sjmisc)


### Name: to_factor
### Title: Convert variable into factor and keep value labels
### Aliases: to_factor

### ** Examples

library(sjlabelled)
data(efc)
# normal factor conversion, loses value attributes
x <- as.factor(efc$e42dep)
frq(x)

# factor conversion, which keeps value attributes
x <- to_factor(efc$e42dep)
frq(x)

# create parially labelled vector
x <- set_labels(efc$e42dep,
                labels = c(`1` = "independent", `4` = "severe dependency",
                           `9` = "missing value"))

# only copy existing value labels
to_factor(x)
get_labels(to_factor(x), values = "p")

# also add labels to non-labelled values
to_factor(x, add.non.labelled = TRUE)
get_labels(to_factor(x, add.non.labelled = TRUE), values = "p")


# Convert to factor, using different reference level
x <- to_factor(efc$e42dep)
str(x)
table(x)

x <- to_factor(efc$e42dep, ref.lvl = 3)
str(x)
table(x)


# easily coerce specific variables in a data frame to factor
# and keep other variables, with their class preserved
to_factor(efc, e42dep, e16sex, c172code)

# use select-helpers from dplyr-package
library(dplyr)
to_factor(efc, contains("cop"), c161sex:c175empl)





