library(wrapr)


### Name: mapsyms
### Title: Map symbol names to referenced values if those values are string
###   scalars (else throw).
### Aliases: mapsyms

### ** Examples


x <- 'a'
y <- 'b'
print(mapsyms(x, y))
d <- data.frame(a = 1, b = 2)
let(mapsyms(x, y), d$x + d$y)




