library(compositions)


### Name: ConfRadius
### Title: Helper to compute confidence ellipsoids
### Aliases: ConfRadius
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
model <- lm(ilr(sa.groups)~sa.groups.area)
cf = coef(model)
plot(ilrInv(cf, x=sa.groups))
for(i in 1:nrow(cf)){
  vr = vcovAcomp(model)[,,i,i]
  vr = ilrvar2clr(vr)
  ellipses(ilrInv(cf[i,]), vr, r=ConfRadius(model, alpha=0.05) )
 }



