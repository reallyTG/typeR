library(ei)


### Name: plot.ei
### Title: Plotting Ecological Inference Estimates
### Aliases: plot.ei

### ** Examples

data(sample)
formula = t ~ x
dbuf <- ei(formula=formula, total="n",data=sample)
plot(dbuf, "tomog")
plot(dbuf, "tomog", "betab", "betaw", "xtfit")



