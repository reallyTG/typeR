library(ldr)


### Name: ldr
### Title: Likelihood-based Dimension Reduction
### Aliases: ldr

### ** Examples

data(bigmac)
fit1 <- ldr(X=bigmac[,-1], y=bigmac[,1], fy=bf(y=bigmac[,1], case="pdisc",
        degree=0, nslices=5), numdir=3, structure="unstr", model="pfc")
summary(fit1)
plot(fit1)

fit2 <- ldr(X=bigmac[,-1], y=bigmac[,1], fy=bf(y=bigmac[,1], case="poly",
        degree=2), numdir=2, structure="aniso", model="pfc")
summary(fit2)
plot(fit2)

fit3 <- ldr(X=as.matrix(bigmac[,-1]), y=bigmac[,1], model="lad", nslices=5)
summary(fit3)
plot(fit3)



