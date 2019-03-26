library(plmm)


### Name: fitted
### Title: Extract Model Fitted Values
### Aliases: fitted.plmm fitted.wplmm fitted.values.plmm
###   fitted.values.wplmm

### ** Examples

data(plmm.data)
model <- plmm(y0~x1+x2+x3|t1, random=cluster, data=plmm.data)
fitted(model)



