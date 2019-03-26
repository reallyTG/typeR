library(ei)


### Name: ei
### Title: Ecological Inference Estimation
### Aliases: EI ei

### ** Examples

data(sample)
form <- t ~ x
dbuf <- ei(form,total="n",data=sample)
summary(dbuf)



