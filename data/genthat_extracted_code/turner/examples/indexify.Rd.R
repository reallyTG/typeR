library(turner)


### Name: indexify
### Title: Create indices for elements in a vector or list
### Aliases: indexify

### ** Examples

# let's say you have a numeric vector like this
num_vec = c(2, 3, 1, 4)

# get indices in vector format
indexify(num_vec)

# let's say you have a list like this
str_list = list(c("a","b","c"), c("d", "e"), c("f","g","h"))

# get indices in vector format
indexify(str_list)

# get indices in list format
indexify(str_list, "list")



