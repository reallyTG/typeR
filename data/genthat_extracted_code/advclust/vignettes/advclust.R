## ---- echo=T-------------------------------------------------------------
library(advclust)
data(iris)
fuzzy.CM(X=iris[,1:4],K = 3,m = 2,RandomNumber = 1234)->cl_CM
show(cl_CM)

## ---- echo=T-------------------------------------------------------------
library(advclust)
data(iris)
fuzzy.GK(X=iris[,1:4],K = 3,m = 2,RandomNumber = 1234)->cl_GK
show(cl_GK)

## ---- echo=T-------------------------------------------------------------
library(advclust)
data(iris)
fuzzy.GG(X=iris[,1:4],K = 3,m = 2,RandomNumber = 1234)->cl_GG
show(cl_GG)

## ---- echo=TRUE,fig.show='hold',fig.width=6,fig.align='center',fig.height=6----
biploting(cl_CM, iris[,1:4], scale=T)->biplot

## ---- echo=TRUE,fig.show='hold',fig.width=6,fig.align='center',fig.height=6----
radar.plotting(cl_CM, iris[,1:4])->radar

## ---- echo=TRUE----------------------------------------------------------
validation.index(cl_GK)

## ---- echo=TRUE----------------------------------------------------------
c_fuzzycluster(cl_GK,cl_GG,cl_CM)->c_consensus
co.vote(c_consensus,"sum")

