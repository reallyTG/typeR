library(tester)


### Name: has_names
### Title: Has or lacks names?
### Aliases: has_names lacks_names

### ** Examples

set.seed(1)
x <- y <- runif(10)
names(x) = letters[1:10]

has_names(x) # TRUE
has_names(y) # FALSE

lacks_names(x) # FALSE
lacks_names(y) # TRUE



