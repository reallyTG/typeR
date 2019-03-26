library(sjmisc)


### Name: add_columns
### Title: Add or replace data frame columns
### Aliases: add_columns replace_columns add_id

### ** Examples

data(efc)
d1 <- efc[, 1:3]
d2 <- efc[, 4:6]

library(dplyr)
head(bind_cols(d1, d2))
add_columns(d1, d2)

d1 <- efc[, 1:3]
d2 <- efc[, 2:6]

add_columns(d1, d2, replace = TRUE)
add_columns(d1, d2, replace = FALSE)

# use case: we take the original data frame, select specific
# variables and do some transformations or recodings
# (standardization in this example) and add the new, transformed
# variables *to the end* of the original data frame
efc %>%
  select(e17age, c160age) %>%
  std() %>%
  add_columns(efc)

# new variables with same name will overwrite old variables
# in "efc". order of columns is not changed.
efc %>%
  select(e16sex, e42dep) %>%
  to_factor() %>%
  add_columns(efc)

# keep both old and new variables, automatically
# rename variables with identical name
efc %>%
  select(e16sex, e42dep) %>%
  to_factor() %>%
  add_columns(efc, replace = FALSE)

# create sample data frames
d1 <- efc[, 1:10]
d2 <- efc[, 2:3]
d3 <- efc[, 7:8]
d4 <- efc[, 10:12]

# show original
head(d1)

library(sjlabelled)
# slightly change variables, to see effect
d2 <- as_label(d2)
d3 <- as_label(d3)

# replace duplicated columns, append remaining
replace_columns(d1, d2, d3, d4)

# replace duplicated columns, omit remaining
replace_columns(d1, d2, d3, d4, add.unique = FALSE)

# add ID to dataset
library(dplyr)
data(mtcars)
add_id(mtcars)

mtcars %>%
  group_by(gear) %>%
  add_id() %>%
  arrange(gear, ID) %>%
  print(n = 100)




