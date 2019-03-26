library(purrr)


### Name: prepend
### Title: Prepend a vector
### Aliases: prepend

### ** Examples

x <- as.list(1:3)

x %>% append("a")
x %>% prepend("a")
x %>% prepend(list("a", "b"), before = 3)



