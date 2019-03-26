library(sjmisc)


### Name: set_na
### Title: Replace specific values in vector with NA
### Aliases: set_na set_na_if

### ** Examples

# create random variable
dummy <- sample(1:8, 100, replace = TRUE)
# show value distribution
table(dummy)
# set value 1 and 8 as missings
dummy <- set_na(dummy, na = c(1, 8))
# show value distribution, including missings
table(dummy, useNA = "always")

# add named vector as further missing value
set_na(dummy, na = c("Refused" = 5), as.tag = TRUE)
# see different missing types
library(haven)
library(sjlabelled)
print_tagged_na(set_na(dummy, na = c("Refused" = 5), as.tag = TRUE))


# create sample data frame
dummy <- data.frame(var1 = sample(1:8, 100, replace = TRUE),
                    var2 = sample(1:10, 100, replace = TRUE),
                    var3 = sample(1:6, 100, replace = TRUE))
# set value 2 and 4 as missings
dummy %>% set_na(na = c(2, 4)) %>% head()
dummy %>% set_na(na = c(2, 4), as.tag = TRUE) %>% get_na()
dummy %>% set_na(na = c(2, 4), as.tag = TRUE) %>% get_values()

data(efc)
dummy <- data.frame(
  var1 = efc$c82cop1,
  var2 = efc$c83cop2,
  var3 = efc$c84cop3
)
# check original distribution of categories
lapply(dummy, table, useNA = "always")
# set 3 to NA for two variables
lapply(set_na(dummy, var1, var3, na = 3), table, useNA = "always")


# if 'na' is a named vector *and* 'as.tag = FALSE', different NA-values
# can be specified for each variable
set.seed(1)
dummy <- data.frame(
  var1 = sample(1:8, 10, replace = TRUE),
  var2 = sample(1:10, 10, replace = TRUE),
  var3 = sample(1:6, 10, replace = TRUE)
)
dummy

# Replace "3" in var1 with NA, "5" in var2 and "6" in var3
set_na(dummy, na = c(var1 = 3, var2 = 5, var3 = 6))

# if 'na' is a named list *and* 'as.tag = FALSE', for each
# variable different multiple NA-values can be specified
set_na(dummy, na = list(var1 = 1:3, var2 = c(7, 8), var3 = 6))


# drop unused factor levels when being set to NA
x <- factor(c("a", "b", "c"))
x
set_na(x, na = "b", as.tag = TRUE)
set_na(x, na = "b", drop.levels = FALSE, as.tag = TRUE)

# set_na() can also remove a missing by defining the value label
# of the value that should be replaced with NA. This is in particular
# helpful if a certain category should be set as NA, however, this category
# is assigned with different values accross variables
x1 <- sample(1:4, 20, replace = TRUE)
x2 <- sample(1:7, 20, replace = TRUE)
x1 <- set_labels(x1, labels = c("Refused" = 3, "No answer" = 4))
x2 <- set_labels(x2, labels = c("Refused" = 6, "No answer" = 7))

tmp <- data.frame(x1, x2)
get_labels(tmp)
table(tmp, useNA = "always")

get_labels(set_na(tmp, na = "No answer"))
table(set_na(tmp, na = "No answer"), useNA = "always")

# show values
tmp
set_na(tmp, na = c("Refused", "No answer"))





