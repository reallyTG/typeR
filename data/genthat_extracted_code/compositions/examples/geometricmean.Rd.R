library(compositions)


### Name: geometricmean
### Title: The geometric mean
### Aliases: geometricmean geometricmeanRow geometricmeanCol
###   gsi.geometricmean gsi.geometricmeanRow gsi.geometricmeanCol
###   gsi.geometricmean.Row gsi.geometricmean.Col
### Keywords: univar

### ** Examples

geometricmean(1:10)  
geometricmean(c(1,0,NA,NaN))  # 0
X <- matrix(c(1,NA,NaN,0,1,2,3,4),nrow=4)
X  
geometricmeanRow(X)
geometricmeanCol(X)



