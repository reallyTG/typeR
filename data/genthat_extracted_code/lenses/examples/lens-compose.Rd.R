library(lenses)


### Name: %.%
### Title: Compose lenses
### Aliases: %.%

### ** Examples

  lst <- list(b = c(3,4,5))
  lns <- index_l("b") %.% index_l(2)
  lst %>% view(lns)                 # returns 4
  lst %>% set(lns, 1)              # returns list(b = c(3,2,5))
  lst                               # returns list(b = c(3,4,5))



