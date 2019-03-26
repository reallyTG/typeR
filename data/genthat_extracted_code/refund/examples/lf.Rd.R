library(refund)


### Name: lf
### Title: Construct an FLM regression term
### Aliases: lf

### ** Examples

data(DTI)
DTI1 <- DTI[DTI$visit==1 & complete.cases(DTI),]

# We can apply various preprocessing options to the DTI data
fit1 <- pfr(pasat ~ lf(cca, k=30), data=DTI1)
fit2 <- pfr(pasat ~ lf(cca, k=30, presmooth="fpca.sc",
                       presmooth.opts=list(nbasis=8, pve=.975)), data=DTI1)
fit3 <- pfr(pasat ~ lf(cca, k=30, presmooth="fpca.face",
                       presmooth.opts=list(m=3, npc=9)), data=DTI1)
fit4 <- pfr(pasat ~ lf(cca, k=30, presmooth="fpca.ssvd"), data=DTI1)
fit5 <- pfr(pasat ~ lf(cca, k=30, presmooth="bspline",
                       presmooth.opts=list(nbasis=8)), data=DTI1)
fit6 <- pfr(pasat ~ lf(cca, k=30, presmooth="interpolate"), data=DTI1)

# All models should result in similar fits
fits <- as.data.frame(lapply(1:6, function(i)
  get(paste0("fit",i))$fitted.values))
names(fits) <- c("none", "fpca.sc", "fpca.face", "fpca.ssvd", "bspline", "interpolate")
pairs(fits)




