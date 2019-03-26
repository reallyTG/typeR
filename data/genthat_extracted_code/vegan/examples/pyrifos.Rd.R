library(vegan)


### Name: pyrifos
### Title: Response of Aquatic Invertebrates to Insecticide Treatment
### Aliases: pyrifos
### Keywords: datasets

### ** Examples

data(pyrifos)
ditch <- gl(12, 1, length=132)
week <- gl(11, 12, labels=c(-4, -1, 0.1, 1, 2, 4, 8, 12, 15, 19, 24))
dose <- factor(rep(c(0.1, 0, 0, 0.9, 0, 44, 6, 0.1, 44, 0.9, 0, 6), 11))



