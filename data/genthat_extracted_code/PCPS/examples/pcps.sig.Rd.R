library(PCPS)


### Name: matrix.p.sig
### Title: Association between phylogeny-weighted species composition and
###   environmental predictors
### Aliases: matrix.p.sig pcps.sig matrix.p.sig
### Keywords: PCPS

### ** Examples


data(flona)
pcps.sig(flona$community, flona$phylo, flona$environment, analysis = "glm",
        formula = "pcps.1~alt", runs = 99)
matrix.p.sig(flona$community,flona$phylo,flona$environment[, 2, drop = FALSE],
        analysis = "adonis", runs = 99)





