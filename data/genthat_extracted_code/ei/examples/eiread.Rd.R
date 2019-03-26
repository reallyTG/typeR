library(ei)


### Name: eiread
### Title: Quantities of Interest from Ecological Inference Estimation
### Aliases: eiread

### ** Examples

data(sample)
formula = t ~ x
dbuf <- ei(formula=formula, total="n",data=sample)
eiread(dbuf, "phi")
eiread(dbuf, "betab", "betaw")



