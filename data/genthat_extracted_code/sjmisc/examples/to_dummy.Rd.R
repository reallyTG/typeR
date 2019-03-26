library(sjmisc)


### Name: to_dummy
### Title: Split (categorical) vectors into dummy variables
### Aliases: to_dummy

### ** Examples

data(efc)
head(to_dummy(efc$e42dep))

# add value label as suffix to new variable name
head(to_dummy(efc$e42dep, suffix = "label"))

# use "dummy" as new variable name
head(to_dummy(efc$e42dep, var.name = "dummy"))

# create multiple dummies, append to data frame
to_dummy(efc, c172code, e42dep)

# pipe-workflow
library(dplyr)
efc %>%
  select(e42dep, e16sex, c172code) %>%
  to_dummy()




