library(purrr)


### Name: every
### Title: Do every or some elements of a list satisfy a predicate?
### Aliases: every some

### ** Examples

y <- list(0:10, 5.5)
y %>% every(is.numeric)
y %>% every(is.integer)



