library(BSagri)


### Name: Lepi
### Title: Insect counts of 12 Species
### Aliases: Lepi
### Keywords: datasets

### ** Examples


data(Lepi)

str(Lepi)

summary(Lepi)

SPEC<-names(Lepi)[-(1:5)]

# Occurrence

occur<-lapply(X=Lepi[,SPEC], FUN=function(x){length(which(x>0))})

unlist(occur)

# Species with reasonable occurence in the whole data:

SPEC2<-SPEC[c(1,2,3,6,8,9,11)]

pairs(Lepi[,SPEC2])

# 


layout(matrix(1:2, ncol=1 ))
par(mar=c(2,8,2,1))

boxplot(Sp2 ~ Treatment*Year, data=Lepi, main="Species 2",
 las=1, horizontal=TRUE, col=c("red","white","white"))

boxplot(Sp3 ~ Treatment*Year, data=Lepi, main="Species 3",
 las=1, horizontal=TRUE, col=c("red","white","white"))





