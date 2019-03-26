library(ldr)


### Name: bf
### Title: Function to generate a basis function.
### Aliases: bf

### ** Examples

data(bigmac)

# Piecewise constant basis with 5 slices
fy=bf(y=bigmac[,1], case="pdisc", degree=0, nslices=5)
fit1 <- pfc(X=bigmac[,-1], y=bigmac[,1], fy=fy, numdir=3, structure="aniso")
summary(fit1)

# Cubic polynomial basis
fy=bf(y=bigmac[,1], case="poly", degree=3)
fit2 <- pfc(X=bigmac[,-1], y=bigmac[,1], fy=fy, numdir=3, structure="aniso")
summary(fit2)

# Piecewise linear continuous with 3 slices
fy=bf(y=bigmac[,1], case="pcont", degree=1, nslices=3)
fit3 <- pfc(X=bigmac[,-1], y=bigmac[,1], fy=fy, numdir=3, structure="unstr")
summary(fit3)



