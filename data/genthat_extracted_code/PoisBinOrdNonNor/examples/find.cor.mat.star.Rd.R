library(PoisBinOrdNonNor)


### Name: find.cor.mat.star
### Title: Finds intermediate correlation matrix
### Aliases: find.cor.mat.star

### ** Examples

validate.cor.mat(cor.mat = .3 * diag(3) + .7, no.pois = 3, 
    pois.list = list(.25, .5, 1))
find.cor.mat.star(cor.mat = .3 * diag(3) + .7, no.pois = 3, 
    pois.list = list(.25, .5, 1))

validate.cor.mat(cor.mat = .8 * diag(3) + .2, no.ord = 3, 
    ord.list = list(c(.2, .8), c(.1, .2, .3, .4), c(.8, 0, .1, .1)))
find.cor.mat.star(cor.mat = .8 * diag(3) + .2, no.ord = 3, 
    ord.list = list(c(.2, .8), c(.1, .2, .3, .4), c(.8, 0, .1, .1)))

validate.cor.mat(cor.mat = .5 * diag(3) + .5, no.pois = 1, no.nonn = 1,
    no.ord = 1, pois.list = list(.5), ord.list = list(c(.8, 0, .1, .1)),
    nonn.list = list(c(0, 1, 0, 1)))
find.cor.mat.star(cor.mat = .5 * diag(3) + .5, no.pois = 1, no.nonn = 1,
    no.ord = 1, pois.list = list(.5), ord.list = list(c(.8, 0, .1, .1)),
    nonn.list = list(c(0, 1, 0, 1)))



