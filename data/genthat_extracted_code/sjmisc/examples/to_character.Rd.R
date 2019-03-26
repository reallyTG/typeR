library(sjmisc)


### Name: to_character
### Title: Convert variable into character vector and replace values with
###   associated value labels
### Aliases: to_character

### ** Examples

library(sjlabelled)
data(efc)
print(get_labels(efc)['c161sex'])
head(efc$c161sex)
head(to_character(efc$c161sex))

print(get_labels(efc)['e42dep'])
table(efc$e42dep)
table(to_character(efc$e42dep))

head(efc$e42dep)
head(to_character(efc$e42dep))

# numeric values w/o value labels will also be converted into character
str(efc$e17age)
str(to_character(efc$e17age))


# factor with non-numeric levels, non-prefixed and prefixed
x <- factor(c("a", "b", "c"))
x <- set_labels(x, labels = c("ape", "bear", "cat"))

to_character(x, prefix = FALSE)
to_character(x, prefix = TRUE)


# create vector
x <- c(1, 2, 3, 2, 4, NA)
# add less labels than values
x <- set_labels(x,
                labels = c("yes", "maybe", "no"),
                force.labels = FALSE,
                force.values = FALSE)
# convert to character w/o non-labelled values
to_character(x)
# convert to character, including non-labelled values
to_character(x, add.non.labelled = TRUE)


# create labelled integer, with missing flag
library(haven)
x <- labelled(c(1:3, tagged_na("a", "c", "z"), 4:1, 2:3),
              c("Agreement" = 1, "Disagreement" = 4, "First" = tagged_na("c"),
                "Refused" = tagged_na("a"), "Not home" = tagged_na("z")))
# to character, with missing labels
to_character(x, drop.na = FALSE)
# to character, missings removed
to_character(x, drop.na = TRUE)
# keep missings, and use non-labelled values as well
to_character(x, add.non.labelled = TRUE, drop.na = FALSE)


# easily coerce specific variables in a data frame to character
# and keep other variables, with their class preserved
to_character(efc, e42dep, e16sex, c172code)




