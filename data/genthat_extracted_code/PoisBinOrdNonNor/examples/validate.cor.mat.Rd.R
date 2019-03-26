library(PoisBinOrdNonNor)


### Name: validate.cor.mat
### Title: Validates the target correlation matrix
### Aliases: validate.cor.mat

### ** Examples

validate.cor.mat(cor.mat = .2 * diag(3) + .8, no.pois = 3, 
    pois.list = list(.25, .5, 1))
validate.cor.mat(cor.mat = .7 * diag(3) + .3, no.ord = 3, 
    ord.list = list(c(.2, .8), c(.1, .2, .3, .4), c(.8, 0, .1, .1)))
validate.cor.mat(cor.mat = .25 * diag(3) + .75, no.pois = 1, 
    no.nonn = 1, no.ord = 1, pois.list = list(.5), 
    ord.list = list(c(.8, 0, .1, .1)), nonn.list=list(c(0, 1, 0, 1)))
validate.cor.mat(cor.mat = .35 * diag(3) + .65, no.pois = 1, 
    no.nonn = 1, no.ord = 1, pois.list = list(.5), 
    ord.list = list(c(.8, 0, .1, .1)), nonn.list=list(c(0, 1, 0, 1)))



