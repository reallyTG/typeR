library(ldr)


### Name: pfc
### Title: Principal fitted components
### Aliases: pfc

### ** Examples

data(bigmac)
fit1 <- pfc(X=bigmac[,-1], y=bigmac[,1], fy=bf(y=bigmac[,1], case="poly",
        degree=3),numdir=3, structure="aniso")
summary(fit1)
plot(fit1)

fit2 <- pfc(X=bigmac[,-1], y=bigmac[,1], fy=bf(y=bigmac[,1], case="poly",
        degree=3), numdir=3, structure="aniso", numdir.test=TRUE)
summary(fit2)
	



