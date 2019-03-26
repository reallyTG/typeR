library(turner)


### Name: dummy_to_list
### Title: Create an indexed list from a dummy matrix
### Aliases: dummy_to_list

### ** Examples

# let's say you have a list like this
some_list = list(1:3, 1:2, 1:4)

# first create a dummy matrix based on some_list
some_dummy = list_to_dummy(some_list)

# now apply 'dummy_to_list'
dummy_to_list(some_dummy)

# a semi-dummy matrix
semi_dummy = some_dummy
semi_dummy[semi_dummy != 0] = rnorm(listsize(some_list))
dummy_to_list(semi_dummy)



