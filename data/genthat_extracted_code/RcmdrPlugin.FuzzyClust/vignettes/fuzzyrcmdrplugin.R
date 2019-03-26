## ---- echo=T-------------------------------------------------------------
library(RcmdrPlugin.FuzzyClust)
data(iris)
fuzzy.CM(X=iris[,1:4],K = 3,m = 2,RandomNumber = 1234)->cl

## ---- echo=T-------------------------------------------------------------
data(iris)
fuzzy.GK(X=iris[,1:4],K = 3,m = 2,RandomNumber = 1234,gamma=0)->cl

## ---- echo=T-------------------------------------------------------------
soft.vote.ensemble(iris[,1:4],seed=3,method="FCM",K=3,m=2,core=1)->Cl

## ---- echo=T-------------------------------------------------------------
fuzzy.CM(X=iris[,1:4],K = 3,m = 2,RandomNumber = 1234)->cl
validation.index(cl)

## ---- echo=TRUE----------------------------------------------------------
checkManova(cl)

## ---- echo=TRUE,fig.show='hold'------------------------------------------
biploting(cl) -> biplotcluster

## ---- echo=TRUE,fig.show='hold'------------------------------------------
radar.plotting(cl) ->radarplot

