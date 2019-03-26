library(episensr)


### Name: multidimBias
### Title: Multidimensional sensitivity analysis for different sources of
###   bias
### Aliases: multidimBias

### ** Examples

multidimBias(matrix(c(45, 94, 257, 945),
dimnames = list(c("HIV+", "HIV-"), c("Circ+", "Circ-")),
nrow = 2, byrow = TRUE),
type = "exposure",
se = c(1, 1, 1, .9, .9, .9, .8, .8, .8),
sp = c(1, .9, .8, 1, .9, .8, 1, .9, .8))
multidimBias(matrix(c(45, 94, 257, 945),
dimnames = list(c("HIV+", "HIV-"), c("Circ+", "Circ-")),
nrow = 2, byrow = TRUE),
type = "outcome",
se = c(1, 1, 1, .9, .9, .9, .8, .8, .8),
sp = c(1, .9, .8, 1, .9, .8, 1, .9, .8))
multidimBias(matrix(c(105, 85, 527, 93),
dimnames = list(c("HIV+", "HIV-"), c("Circ+", "Circ-")),
nrow = 2, byrow = TRUE),
type = "confounder",
bias_parms = list(seq(.72, .92, by = .02),
seq(.01, .11, by = .01), seq(.13, 1.13, by = .1)))
multidimBias(matrix(c(136, 107, 297, 165),
dimnames = list(c("Uveal Melanoma+", "Uveal Melanoma-"),
c("Mobile Use+", "Mobile Use -")),
nrow = 2, byrow = TRUE),
type = "selection",
OR.sel = seq(1.5, 6.5, by = .5))



