library(rebus.base)


### Name: or
### Title: Alternation
### Aliases: or %|% or1

### ** Examples

# or takes an arbitrary number of arguments and groups them without capture
# Notice the recycling of inputs
or(letters, month.abb, "foo")

# or1 takes a single character vector
or1(c(letters, month.abb, "foo")) # Not the same as before!

# Capture the group
or1(letters, capture = TRUE)

# Don't create a group
or1(letters, capture = NA)

# The pipe operator doesn't group
letters %|% month.abb %|% "foo"

# Usage
(rx <- or("dog", "cat", "hippopotamus"))
stringi::stri_detect_regex(c("boondoggle", "caterwaul", "water-horse"), rx)



