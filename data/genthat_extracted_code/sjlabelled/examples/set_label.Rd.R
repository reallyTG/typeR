library(sjlabelled)


### Name: set_label
### Title: Add variable label(s) to variables
### Aliases: set_label set_label<- var_labels

### ** Examples

# manually set value and variable labels
dummy <- sample(1:4, 40, replace = TRUE)
dummy <- set_labels(dummy, labels = c("very low", "low", "mid", "hi"))
dummy <- set_label(dummy, label = "Dummy-variable")

# or use:
# set_label(dummy) <- "Dummy-variable"

# auto-detection of value labels by default, auto-detection of
# variable labels if argument "title" set to NULL.
## Not run: 
##D library(sjPlot)
##D sjp.frq(dummy, title = NULL)
## End(Not run)


# Set variable labels for data frame
dummy <- data.frame(
  a = sample(1:4, 10, replace = TRUE),
  b = sample(1:4, 10, replace = TRUE),
  c = sample(1:4, 10, replace = TRUE)
)
dummy <- set_label(dummy, c("Variable A", "Variable B", "Variable C"))
str(dummy)

# remove one variable label
dummy <- set_label(dummy, c("Variable A", "", "Variable C"))
str(dummy)


# setting same variable labels to multiple vectors

# create a set of dummy variables
dummy1 <- sample(1:4, 40, replace = TRUE)
dummy2 <- sample(1:4, 40, replace = TRUE)
dummy3 <- sample(1:4, 40, replace = TRUE)
# put them in list-object
dummies <- list(dummy1, dummy2, dummy3)
# and set variable labels for all three dummies
dummies <- set_label(dummies, c("First Dummy", "2nd Dummy", "Third dummy"))
# see result...
get_label(dummies)


# use 'var_labels()' to set labels within a pipe-workflow, and
# when you need "tidyverse-consistent" api.
# Set variable labels for data frame
dummy <- data.frame(
  a = sample(1:4, 10, replace = TRUE),
  b = sample(1:4, 10, replace = TRUE),
  c = sample(1:4, 10, replace = TRUE)
)

dummy %>%
  var_labels(a = "First variable", c = "third variable") %>%
  get_label()




