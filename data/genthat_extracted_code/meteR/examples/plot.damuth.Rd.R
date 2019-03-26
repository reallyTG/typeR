library(meteR)


### Name: plot.damuth
### Title: Plot the relationship between abundance and metabolic rate, i.e.
###   objects of class damuth
### Aliases: plot.damuth

### ** Examples

data(arth)
esf1 <- meteESF(arth$spp, arth$count, arth$mass^0.75)
ebar1 <- ebar(esf1)
plot(ebar1)



