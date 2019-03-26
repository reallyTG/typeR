library(xmeta)


### Name: summary.mpbt
### Title: Summarize the objects 'mpbt'
### Aliases: summary.mpbt
### Keywords: summary

### ** Examples

data(prostate)
fit.mpbt=mpbt(data=prostate, method = "nn.cl", type = "continuous", k=2)
summary(fit.mpbt)



