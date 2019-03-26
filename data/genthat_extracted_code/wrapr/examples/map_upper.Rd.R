library(wrapr)


### Name: map_upper
### Title: Map up-cased symbol names to referenced values if those values
###   are string scalars (else throw).
### Aliases: map_upper

### ** Examples


x <- 'a'
print(map_upper(x))
d <- data.frame(a = "a_val")
let(map_upper(x), paste(d$X, x))




