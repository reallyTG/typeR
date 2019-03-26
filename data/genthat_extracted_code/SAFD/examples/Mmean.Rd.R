library(SAFD)


### Name: Mmean
### Title: Minkowski mean
### Aliases: Mmean
### Keywords: univar manip

### ** Examples

#Example 1:
data(XX)
A<-Mmean(XX,1)

X<-translator(XX[[1]],50)
Y<-translator(XX[[2]],50)
Z<-translator(XX[[3]],50)
YY<-list(X,Y,Z)
A<-Mmean(YY,pic=1)


#Example 2:
data(Trees)
Species1_Mean<-Mmean(Trees[[1]],1)
Species1_Mean
Species2_Mean<-Mmean(Trees[[2]],1)
Species2_Mean
Species3_Mean<-Mmean(Trees[[3]],1)
Species3_Mean



