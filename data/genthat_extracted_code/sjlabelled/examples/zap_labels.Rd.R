library(sjlabelled)


### Name: drop_labels
### Title: Drop, add or convert (non-)labelled values
### Aliases: drop_labels fill_labels zap_labels zap_unlabelled

### ** Examples

# zap_labels() ----

data(efc)
str(efc$e42dep)

x <- set_labels(
  efc$e42dep,
  labels = c("independent" = 1, "severe dependency" = 4)
)
table(x)
get_values(x)
str(x)

# zap all labelled values
table(zap_labels(x))
get_values(zap_labels(x))
str(zap_labels(x))

# zap all unlabelled values
table(zap_unlabelled(x))
get_values(zap_unlabelled(x))
str(zap_unlabelled(x))

# in a pipe-workflow
library(dplyr)
efc %>%
  select(c172code, e42dep) %>%
  set_labels(
    e42dep,
    labels = c("independent" = 1, "severe dependency" = 4)
  ) %>%
  zap_labels()


# drop_labels() ----

library(sjmisc)
rp <- rec_pattern(1, 100)
rp

# sample data
data(efc)
# recode carers age into groups of width 5
x <- rec(efc$c160age, rec = rp$pattern)
# add value labels to new vector
x <- set_labels(x, labels = rp$labels)

# watch result. due to recode-pattern, we have age groups with
# no observations (zero-counts)
frq(x)
# now, let's drop zero's
frq(drop_labels(x))

# drop labels, also drop NA value labels, then also zap tagged NA
library(haven)
x <- labelled(c(1:3, tagged_na("z"), 4:1),
              c("Agreement" = 1, "Disagreement" = 4, "Unused" = 5,
                "Not home" = tagged_na("z")))
x
drop_labels(x, drop.na = FALSE)
drop_labels(x)
zap_na_tags(drop_labels(x))


# fill_labels() ----

# create labelled integer, with tagged missings
library(haven)
x <- labelled(
  c(1:3, tagged_na("a", "c", "z"), 4:1),
  c("Agreement" = 1, "Disagreement" = 4, "First" = tagged_na("c"),
    "Refused" = tagged_na("a"), "Not home" = tagged_na("z"))
  )
# get current values and labels
x
get_labels(x)

fill_labels(x)
get_labels(fill_labels(x))
# same as
get_labels(x, non.labelled = TRUE)




