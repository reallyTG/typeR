library(PHYLOGR)


### Name: plot.phylog.lm
### Title: Plot a phylog.lm object
### Aliases: plot.phylog.lm
### Keywords: methods

### ** Examples

data(SimulExample)
ex1.lm <- lm.phylog(y ~ x1 + diet, weights=x2, max.num=20, data=SimulExample)
options(digits=5)
plot(ex1.lm)



