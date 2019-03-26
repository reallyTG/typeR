library(plmm)


### Name: plmm.bs
### Title: Bootstrap Inference
### Aliases: plmm.bs

### ** Examples

data(plmm.data)
h0 <- select.h0(y1~x1+x2+x3|t1, data=plmm.data)
model <- plmm(y1~x1+x2+x3|t1, h0=h0, random=cluster, data=plmm.data)
model2 <- wplmm(model, heteroX=x3, data=plmm.data)

## Not run: 
##D bs <- plmm.bs(model, B=500, data=plmm.data, h0=h0)
##D bs2 <- plmm.bs(model2, B=500, data=plmm.data, h0=h0) 
## End(Not run)



