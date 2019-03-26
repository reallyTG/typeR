library(lenses)


### Name: map_l
### Title: Promote a lens to apply to each element of a list
### Aliases: map_l

### ** Examples

(ex <- replicate(10, sample(1:5), simplify = FALSE))
view(ex, map_l(index(1)))
set(ex, map_l(index(1)), 11:20)



