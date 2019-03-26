library(xmeta)


### Name: summary.mmeta
### Title: Summarize the objects 'mmeta'
### Aliases: summary.mmeta
### Keywords: summary

### ** Examples

data(prostate)
fit.nn=mmeta(data=prostate, type="continuous", k=2, method="nn.cl") 
summary(fit.nn)



