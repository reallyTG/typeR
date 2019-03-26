library(plmm)


### Name: wplmm
### Title: Weighted Partially Linear Mixed Effects Model
### Aliases: wplmm
### Keywords: regression nonparametric

### ** Examples

data(plmm.data)
model <- plmm(y1~x1+x2+x3|t1, random=cluster, data=plmm.data)
model2 <- wplmm(model, heteroX=x3, data=plmm.data)
summary(model2)



