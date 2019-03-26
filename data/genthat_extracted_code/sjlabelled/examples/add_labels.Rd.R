library(sjlabelled)


### Name: add_labels
### Title: Add, replace or remove value labels of variables
### Aliases: add_labels replace_labels remove_labels

### ** Examples

# add_labels()
data(efc)
get_labels(efc$e42dep)

x <- add_labels(efc$e42dep, labels = c(`nothing` = 5))
get_labels(x)

library(dplyr)
x <- efc %>%
  # select three variables
  dplyr::select(e42dep, c172code, c161sex) %>%
  # only add new label to two of those
  add_labels(e42dep, c172code, labels = c(`nothing` = 5))
# see data frame, with selected variables having new labels
get_labels(x)

x <- add_labels(efc$e42dep, labels = c(`nothing` = 5, `zero value` = 0))
get_labels(x, values = "p")

# replace old value labels
x <- add_labels(
  efc$e42dep,
  labels = c(`not so dependent` = 4, `lorem ipsum` = 5)
)
get_labels(x, values = "p")

# replace specific missing value (tagged NA)
library(haven)
x <- labelled(c(1:3, tagged_na("a", "c", "z"), 4:1),
              c("Agreement" = 1, "Disagreement" = 4, "First" = tagged_na("c"),
                "Refused" = tagged_na("a"), "Not home" = tagged_na("z")))
# get current NA values
x
# tagged NA(c) has currently the value label "First", will be
# replaced by "Second" now.
replace_labels(x, labels = c("Second" = tagged_na("c")))


# remove_labels()

x <- remove_labels(efc$e42dep, labels = 2)
get_labels(x, values = "p")

x <- remove_labels(efc$e42dep, labels = "independent")
get_labels(x, values = "p")

library(haven)
x <- labelled(c(1:3, tagged_na("a", "c", "z"), 4:1),
              c("Agreement" = 1, "Disagreement" = 4, "First" = tagged_na("c"),
                "Refused" = tagged_na("a"), "Not home" = tagged_na("z")))
# get current NA values
get_na(x)
get_na(remove_labels(x, labels = tagged_na("c")))




