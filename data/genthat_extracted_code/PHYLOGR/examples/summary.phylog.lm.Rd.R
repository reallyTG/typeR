library(PHYLOGR)


### Name: summary.phylog.lm
### Title: Summarize a phylog.lm object
### Aliases: summary.phylog.lm
### Keywords: methods

### ** Examples

data(SimulExample)
ex1.lm <- lm.phylog(y ~ x1 + diet, weights=x2, max.num=20, data=SimulExample)
summary(ex1.lm)



