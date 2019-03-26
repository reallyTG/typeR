library(quanteda)


### Name: merge_dictionary_values
### Title: Internal function to merge values of duplicated keys
### Aliases: merge_dictionary_values
### Keywords: internal

### ** Examples

dict <- list('A' = list(AA = list('aaaaa'), 'a'), 
             'B' = list('b'),
             'C' = list('c'),
             'A' = list('aa'))
quanteda:::merge_dictionary_values(dict)



