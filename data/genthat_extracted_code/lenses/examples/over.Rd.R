library(lenses)


### Name: over
### Title: Map a function over a lens
### Aliases: over

### ** Examples

third_l <- index(3)
over(1:5, third_l, function(x) x + 2)
# returns c(1:2, 5, 4:5)  



