library(rmonad)


### Name: loop
### Title: Apply an rmonad pipeline function to each element in a rmonad
###   bound list
### Aliases: loop

### ** Examples

foo <- function(x) { x %>>% sqrt }
c(256, 6561) %v>% sqrt %>% loop(foo) %>>% lapply(sqrt)



