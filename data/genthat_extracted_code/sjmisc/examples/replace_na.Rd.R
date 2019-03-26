library(sjmisc)


### Name: replace_na
### Title: Replace NA with specific values
### Aliases: replace_na

### ** Examples

library(sjlabelled)
data(efc)
table(efc$e42dep, useNA = "always")
table(replace_na(efc$e42dep, value = 99), useNA = "always")

# the original labels
get_labels(replace_na(efc$e42dep, value = 99))
# NA becomes "99", and is labelled as "former NA"
get_labels(
  replace_na(efc$e42dep, value = 99, na.label = "former NA"),
  values = "p"
)

dummy <- data.frame(
  v1 = efc$c82cop1,
  v2 = efc$c83cop2,
  v3 = efc$c84cop3
)
# show original distribution
lapply(dummy, table, useNA = "always")
# show variables, NA's replaced with 99
lapply(replace_na(dummy, v2, v3, value = 99), table, useNA = "always")

library(haven)
x <- labelled(c(1:3, tagged_na("a", "c", "z"), 4:1),
              c("Agreement" = 1, "Disagreement" = 4, "First" = tagged_na("c"),
                "Refused" = tagged_na("a"), "Not home" = tagged_na("z")))
# get current NA values
x
get_na(x)

# replace only the NA, which is tagged as NA(c)
replace_na(x, value = 2, tagged.na = "c")
get_na(replace_na(x, value = 2, tagged.na = "c"))

table(x)
table(replace_na(x, value = 2, tagged.na = "c"))

# tagged NA also works for non-labelled class
# init vector
x <- c(1, 2, 3, 4)
# set values 2 and 3 as tagged NA
x <- set_na(x, na = c(2, 3), as.tag = TRUE)
# see result
x
# now replace only NA tagged with 2 with value 5
replace_na(x, value = 5, tagged.na = "2")




