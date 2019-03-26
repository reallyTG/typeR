library(codebook)


### Name: list_to_dict
### Title: Go from a named list to a key-value data frame or data
###   dictionary and back
### Aliases: list_to_dict dict_to_list

### ** Examples

data('bfi')
labels <- var_label(bfi)
head(labels, 2)
dict <- list_to_dict(labels)
head(dict, 2)
head(dict_to_list(list_to_dict(labels)), 2)






