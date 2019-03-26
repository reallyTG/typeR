library(ei)


### Name: summary.ei
### Title: Summarize Ecological Inference Estimates
### Aliases: summary.ei

### ** Examples

data(sample)
formula = t ~ x
dbuf <- ei(formula=formula, total="n",data=sample)
print(summary(dbuf))



