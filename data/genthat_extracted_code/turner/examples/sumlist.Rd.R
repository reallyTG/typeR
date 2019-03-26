library(turner)


### Name: sumlist
### Title: Sum of all elements in a list
### Aliases: sumlist

### ** Examples

# say you have some list
list1 = list(1:5, runif(3), rnorm(4))

# get the sum of all elements in list1
sumlist(list1)

# say you have missing data
list2 = list(c(1:4, NA), runif(3), rnorm(4))

# get the sum of all elements in list2 removing NAs
sumlist(list2, na.rm=TRUE)



