library(plmm)


### Name: residuals
### Title: Extract Model Residuals
### Aliases: residuals.plmm residuals.wplmm resid.plmm resid.wplmm

### ** Examples

data(plmm.data)
model <- plmm(y0~x1+x2+x3|t1, random=cluster, data=plmm.data)
residuals(model)



