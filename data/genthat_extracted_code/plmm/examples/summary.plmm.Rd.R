library(plmm)


### Name: summary
### Title: Summary of a Fitted Partially Linear Mixed Effects Model.
### Aliases: summary.plmm summary.wplmm

### ** Examples

data(plmm.data)
model <- plmm(y0~x1+x2+x3|t1, random=cluster, data=plmm.data)
summary(model)



