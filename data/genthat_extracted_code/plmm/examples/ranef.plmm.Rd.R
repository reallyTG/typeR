library(plmm)


### Name: ranef
### Title: Random Effects Prediction
### Aliases: ranef.plmm ranef.wplmm

### ** Examples

data(plmm.data)
model <- plmm(y0~x1+x2+x3|t1, random=cluster, data=plmm.data)
ranef(model, data=plmm.data)



