library(ade4)


### Name: corkdist
### Title: Tests of randomization between distances applied to 'kdist'
###   objetcs
### Aliases: corkdist mantelkdist RVkdist print.corkdist summary.corkdist
###   plot.corkdist
### Keywords: nonparametric

### ** Examples

data(friday87)
fri.w <- ktab.data.frame(friday87$fau, friday87$fau.blo, tabnames = friday87$tab.names)
fri.kc <- lapply(1:10, function(x) dist.binary(fri.w[[x]], 10))
names(fri.kc) <- substr(friday87$tab.names, 1, 4)
fri.kd <- kdist(fri.kc)
fri.mantel <- mantelkdist(kd = fri.kd, nrepet = 999)

plot(fri.mantel, 1:5, 1:5)
plot(fri.mantel, 1:5, 6:10)
plot(fri.mantel, 6:10, 1:5)
plot(fri.mantel, 6:10, 6:10)
s.corcircle(dudi.pca(as.data.frame(fri.kd), scan = FALSE)$co)
plot(RVkdist(fri.kd), 1:5, 1:5)

data(yanomama)
m1 <- mantelkdist(kdist(yanomama), 999)
m1
summary(m1)
plot(m1)



