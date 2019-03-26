library(lenses)


### Name: oscope
### Title: Bind data to a lens
### Aliases: oscope

### ** Examples

list(a = 5, b = 1:3, c = 8) %>%
  oscope()   %.%
  index_l("b") %.%
  index_l(1)   %>%
  set(10)



