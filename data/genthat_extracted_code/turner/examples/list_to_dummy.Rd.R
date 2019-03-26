library(turner)


### Name: list_to_dummy
### Title: Create a dummy matrix from the elements in a list
### Aliases: list_to_dummy

### ** Examples

# let's say you have a list like this
num_list = list(1:3, 4:5, 6:9)

# get dummy matrix
list_to_dummy(num_list)

# try with a list of strings
str_list = list(c("a","b","c"), c("d", "e"), c("f","g","h"))
list_to_dummy(str_list)



