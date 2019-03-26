library(rmonad)


### Name: views
### Title: Get a list of Rmonad objects matching the given tag
### Aliases: views

### ** Examples

library(magrittr)
1 %>>% prod(2) %>% tag('a/b') %>>%
       prod(2) %>% tag('a/c') %>>%
       prod(2) %>% tag('a/c') %>>%
       prod(2) %>% tag('g/a') -> m
views(m, 'a')



