library(sjmisc)


### Name: to_label
### Title: Convert variable into factor with associated value labels
### Aliases: to_label

### ** Examples

library(sjlabelled)
data(efc)
print(get_labels(efc)['c161sex'])
head(efc$c161sex)
head(to_label(efc$c161sex))

print(get_labels(efc)['e42dep'])
table(efc$e42dep)
table(to_label(efc$e42dep))

head(efc$e42dep)
head(to_label(efc$e42dep))

# structure of numeric values won't be changed
# by this function, it only applies to labelled vectors
# (typically categorical or factor variables)
str(efc$e17age)
str(to_label(efc$e17age))


# factor with non-numeric levels
to_label(factor(c("a", "b", "c")))

# factor with non-numeric levels, prefixed
x <- factor(c("a", "b", "c"))
x <- set_labels(x, labels = c("ape", "bear", "cat"))
to_label(x, prefix = TRUE)


# create vector
x <- c(1, 2, 3, 2, 4, NA)
# add less labels than values
x <- set_labels(x,
                labels = c("yes", "maybe", "no"),
                force.labels = FALSE,
                force.values = FALSE)
# convert to label w/o non-labelled values
to_label(x)
# convert to label, including non-labelled values
to_label(x, add.non.labelled = TRUE)


# create labelled integer, with missing flag
library(haven)
x <- labelled(c(1:3, tagged_na("a", "c", "z"), 4:1, 2:3),
              c("Agreement" = 1, "Disagreement" = 4, "First" = tagged_na("c"),
                "Refused" = tagged_na("a"), "Not home" = tagged_na("z")))
# to labelled factor, with missing labels
to_label(x, drop.na = FALSE)
# to labelled factor, missings removed
to_label(x, drop.na = TRUE)
# keep missings, and use non-labelled values as well
to_label(x, add.non.labelled = TRUE, drop.na = FALSE)


# convert labelled character to factor
dummy <- c("M", "F", "F", "X")
dummy <- set_labels(
  dummy,
  labels = c(`M` = "Male", `F` = "Female", `X` = "Refused")
)
get_labels(dummy,, "p")
to_label(dummy)

# drop unused factor levels, but preserve variable label
x <- factor(c("a", "b", "c"), levels = c("a", "b", "c", "d"))
x <- set_labels(x, labels = c("ape", "bear", "cat"))
set_label(x) <- "A factor!"
x
to_label(x, drop.levels = TRUE)

# change variable label
to_label(x, var.label = "New variable label!", drop.levels = TRUE)


# easily coerce specific variables in a data frame to factor
# and keep other variables, with their class preserved
to_label(efc, e42dep, e16sex, c172code)




