library(qtl)


### Name: stepwiseqtl
### Title: Stepwise selection for multiple QTL
### Aliases: stepwiseqtl
### Keywords: models

### ** Examples

data(fake.bc)
## Don't show: 
fake.bc <- subset(fake.bc, chr=c(1,2,3,5))
## End(Don't show)
## Not run: fake.bc <- calc.genoprob(fake.bc, step=2.5)
## Don't show: 
fake.bc <- calc.genoprob(fake.bc, step=0)
## End(Don't show)
outsw <- stepwiseqtl(fake.bc, max.qtl=3, method="hk", keeptrace=TRUE)

# best model
outsw
plotModel(outsw)

# path through model space
thetrace <- attr(outsw, "trace")

# plot of these
par(mfrow=c(3,3))
for(i in seq(along=thetrace))
  plotModel(thetrace[[i]], main=paste("pLOD =",round(attr(thetrace[[i]],"pLOD"), 2)))



