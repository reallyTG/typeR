library(NAM)


### Name: MLM REML
### Title: Restricted Maximum Likelihood
### Aliases: reml MCreml
### Keywords: REML BLUP

### ** Examples


# Fitting a random model
data(tpod)
FIT = reml(y=y,Z=~as.factor(fam))

# Fitting GBLUP
G = GRM(gen)
GBLUP = reml(y=y,K=G)

# GBLUP vs RRBLUP
g = tcrossprod(gen)
gblup = reml(y=y,K=g)
rrblup = reml(y=y,Z=gen)
rbind(gblup$VC,rrblup$VC)
gebv_gblup = gblup$EBV
gebv_rrblup = c(tcrossprod(t(rrblup$EBV),gen))
plot(gebv_gblup,gebv_rrblup)




