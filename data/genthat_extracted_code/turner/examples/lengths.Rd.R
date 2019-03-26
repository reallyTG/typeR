library(turner)


### Name: lengths
### Title: Length of each element within a list
### Aliases: lengths

### ** Examples

# say you have some list
some_list = list(1:3, 4:5, 6:9)

# length of each vector (output in vector format)
lengths(some_list)

# length of each vector (output in list format)
lengths(some_list, out = 'list')

# compare to 'length()'
length(some_list)



