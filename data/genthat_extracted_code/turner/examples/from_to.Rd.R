library(turner)


### Name: from_to
### Title: Starting and ending positions
### Aliases: from_to

### ** Examples

# let's say you have a numeric vector like this
num_vec = c(2, 3, 1, 4)

# get 'from' and 'to' indices
start_end = from_to(num_vec)
from = start_end$from
to = start_end$to

#' let's say you have a list like this
str_list = list(c("a","b","c"), c("d", "e"), c("f","g","h"))

# get 'from' and 'to' indices
start_end = from_to(str_list)
from = start_end$from
to = start_end$to



