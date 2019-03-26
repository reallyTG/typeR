library(lenses)


### Name: lens
### Title: Construct a lens
### Aliases: lens

### ** Examples

third_l <- lens(view = function(d) d[[3]],
                set = function(d, x){ d[[3]] <- x; d })
view(1:10, third_l) # returns 3
set(1:10, third_l, 10) # returns c(1:2, 10, 4:10)



