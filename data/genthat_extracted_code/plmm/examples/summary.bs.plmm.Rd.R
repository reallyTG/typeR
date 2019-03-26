library(plmm)


### Name: summary.bs.plmm
### Title: Summary of the bootstrap estimates of the sampling distribution.
### Aliases: summary.bs.plmm

### ** Examples

data(plmm.data)
h0 <- select.h0(y0~x1+x2+x3|t1, data=plmm.data)
model <- plmm(y0~x1+x2+x3|t1, h0=h0, random=cluster, data=plmm.data)
## Not run: 
##D bs <- plmm.bs(model, B=500, data=plmm.data, h0=h0)
##D summary(bs, probs=c(0.025, 0.975)) 
## End(Not run)



