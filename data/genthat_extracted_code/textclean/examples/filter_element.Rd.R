library(textclean)


### Name: filter_element
### Title: Remove Elements in a Vetor
### Aliases: filter_element

### ** Examples

x <- c('dog', 'cat', 'bat', 'dingo', 'dragon', 'dino')
filter_element(x, '^d.+?g')
filter_element(x, 'at$')
filter_element(x, '^d')
filter_element(x, '\\b(dog|cat)\\b')



