library(PoisBinOrdNonNor)


### Name: lower.upper.cors
### Title: Computes lower and upper correlation bounds
### Aliases: lower.upper.cors

### ** Examples

lower.upper.cors(no.nonn = 2, nonn.list = list(c(0, 1, 0, 1), c(0, 1, 0, 2)))
lower.upper.cors(no.pois = 2, pois.list = list(.5, 1))
lower.upper.cors(no.ord = 3,  ord.list = list(c(.2, .8), c(.1, .2, .3, .4), 
    c(.8, 0, .1, .1)))
lower.upper.cors(no.pois = 1, no.nonn = 1, no.ord = 1, pois.list = list(.5), 
    ord.list = list(c(.8, 0, .1, .1)), nonn.list = list(c(0, 1, 0, 1)))



