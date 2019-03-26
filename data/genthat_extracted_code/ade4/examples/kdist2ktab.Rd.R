library(ade4)


### Name: kdist2ktab
### Title: Transformation of K distance matrices (object 'kdist') into K
###   Euclidean representations (object 'ktab')
### Aliases: kdist2ktab
### Keywords: multivariate

### ** Examples

data(friday87)
fri.w <- ktab.data.frame(friday87$fau, friday87$fau.blo, tabnames = friday87$tab.names)
fri.kd <- lapply(1:10, function(x) dist.binary(fri.w[[x]], 10))
names(fri.kd) <- substr(friday87$tab.names, 1, 4)
fri.kd <- kdist(fri.kd)
fri.ktab <- kdist2ktab(kd = fri.kd)
fri.sepan <- sepan(fri.ktab)
plot(fri.sepan)

tapply(fri.sepan$Eig, fri.sepan$TC[,1], sum)
# the sum of the eigenvalues is constant and equal to 1, for each K tables

fri.statis <- statis(fri.ktab, scan = FALSE, nf = 2)
round(fri.statis$RV, dig = 2)

fri.mfa <- mfa(fri.ktab, scan = FALSE, nf = 2)
fri.mcoa <- mcoa(fri.ktab, scan = FALSE, nf = 2)

apply(fri.statis$RV, 1, mean) 
fri.statis$RV.tabw 
plot(apply(fri.statis$RV, 1, mean), fri.statis$RV.tabw)
plot(fri.statis$RV.tabw, fri.statis$RV.tabw)



