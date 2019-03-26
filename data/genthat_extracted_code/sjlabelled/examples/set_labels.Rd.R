library(sjlabelled)


### Name: set_labels
### Title: Add value labels to variables
### Aliases: set_labels

### ** Examples

library(sjmisc)
dummy <- sample(1:4, 40, replace = TRUE)
frq(dummy)

dummy <- set_labels(dummy, labels = c("very low", "low", "mid", "hi"))
frq(dummy)

# assign labels with named vector
dummy <- sample(1:4, 40, replace = TRUE)
dummy <- set_labels(dummy, labels = c("very low" = 1, "very high" = 4))
frq(dummy)

# force using all labels, even if not all labels
# have associated values in vector
x <- c(2, 2, 3, 3, 2)
# only two value labels
x <- set_labels(x, labels = c("1", "2", "3"))
x
frq(x)

# all three value labels
x <- set_labels(x, labels = c("1", "2", "3"), force.labels = TRUE)
x
frq(x)

# create vector
x <- c(1, 2, 3, 2, 4, NA)
# add less labels than values
x <- set_labels(x, labels = c("yes", "maybe", "no"), force.values = FALSE)
x
# add all necessary labels
x <- set_labels(x, labels = c("yes", "maybe", "no"), force.values = TRUE)
x

# set labels and missings
x <- c(1, 1, 1, 2, 2, -2, 3, 3, 3, 3, 3, 9)
x <- set_labels(x, labels = c("Refused", "One", "Two", "Three", "Missing"))
x
set_na(x, na = c(-2, 9))


library(haven)
x <- labelled(
  c(1:3, tagged_na("a", "c", "z"), 4:1),
  c("Agreement" = 1, "Disagreement" = 4, "First" = tagged_na("c"),
    "Refused" = tagged_na("a"), "Not home" = tagged_na("z"))
)
# get current NA values
x
get_na(x)
# lose value labels from tagged NA by default, if not specified
set_labels(x, labels = c("New Three" = 3))
# do not drop na
set_labels(x, labels = c("New Three" = 3), drop.na = FALSE)


# set labels via named vector,
# not using all possible values
data(efc)
get_labels(efc$e42dep)

x <- set_labels(
  efc$e42dep,
  labels = c(`independent` = 1,
             `severe dependency` = 2,
             `missing value` = 9)
  )
get_labels(x, values = "p")
get_labels(x, values = "p", non.labelled = TRUE)

# labels can also be set for tagged NA value
# create numeric vector
x <- c(1, 2, 3, 4)
# set 2 and 3 as missing, which will automatically set as
# tagged NA by 'set_na()'
x <- set_na(x, na = c(2, 3))
x
# set label via named vector just for tagged NA(3)
set_labels(x, labels = c(`New Value` = tagged_na("3")))

# setting same value labels to multiple vectors
dummies <- data.frame(
  dummy1 = sample(1:4, 40, replace = TRUE),
  dummy2 = sample(1:4, 40, replace = TRUE),
  dummy3 = sample(1:4, 40, replace = TRUE)
)

# and set same value labels for two of three variables
dummies <- set_labels(
  dummies, dummy1, dummy2,
  labels = c("very low", "low", "mid", "hi")
)
# see result...
get_labels(dummies)




