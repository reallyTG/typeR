library(plmm)


### Name: coef
### Title: Extract Fixed Regression Coefficients
### Aliases: coef.plmm coef.wplmm coefficients.plmm coefficients.wplmm

### ** Examples

data(plmm.data)
model <- plmm(y0~x1+x2+x3|t1, random=cluster, data=plmm.data)
coef(model)
model$coef.iter



