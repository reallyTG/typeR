library(quanteda)


### Name: nest_dictionary
### Title: Utility function to generate a nested list
### Aliases: nest_dictionary
### Keywords: internal

### ** Examples

list_flat <- list('A' = c('a', 'aa', 'aaa'), 'B' = c('b', 'bb'), 'C' = c('c', 'cc'), 'D' = c('ddd'))
dict_flat <- quanteda:::list2dictionary(list_flat)
quanteda:::nest_dictionary(dict_flat, c(1, 1, 2, 2))
quanteda:::nest_dictionary(dict_flat, c(1, 2, 1, 2))




