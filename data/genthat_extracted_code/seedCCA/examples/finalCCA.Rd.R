library(seedCCA)


### Name: finalCCA
### Title: finalized CCA in seeded CCA
### Aliases: finalCCA

### ** Examples

########  data(cookie) ########
data(cookie)
myseq <- seq(141, 651, by=2)
X <- as.matrix(cookie[-c(23,61), myseq])
Y <- as.matrix(cookie[-c(23,61), 701:704])
min.pr <- min( dim(X)[2], dim(Y)[2])
MX0 <- iniCCA(X, Y, u=4, num.d=min.pr)
ini.X <- X %*% MX0
finalCCA(ini.X, Y)

########  data(nutrimouse) ########
data(nutrimouse)
Y<-as.matrix(nutrimouse$lipid)
X<-as.matrix(nutrimouse$gene)
MX0 <- iniCCA(X, Y, u=4, num.d=4)
MY0 <- iniCCA(Y, X, u=5, num.d=4)
ini.X <- X %*% MX0
ini.Y <- Y %*% MY0
finalCCA(ini.X, ini.Y)



