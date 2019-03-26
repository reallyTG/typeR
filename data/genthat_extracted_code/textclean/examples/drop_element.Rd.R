library(textclean)


### Name: drop_element
### Title: Filter Elements in a Vetor
### Aliases: drop_element drop_element_regex drop_element_fixed
###   keep_element keep_element_fixed keep_element_regex

### ** Examples

x <- c('dog', 'cat', 'bat', 'dingo', 'dragon', 'dino')
drop_element(x, '^d.+?g')
keep_element(x, '^d.+?g')
drop_element(x, 'at$')
drop_element(x, '^d')
drop_element(x, '\\b(dog|cat)\\b')

drop_element_fixed(x, 'bat', 'cat')
drops <- c('bat', 'cat')
drop_element_fixed(x, drops)



