library(PPtree)


### Name: PPindex.class
### Title: Calculate Projection Pursuit index
### Aliases: PPindex.class PPindex.LDA PPindex.Lp PPindex.PDA
### Keywords: multivariate

### ** Examples

data(iris)

PPindex.class("LDA",iris[,1:2],iris[,5])
PPindex.class("LDA",iris[,1:2],iris[,5],weight=FALSE)
PPindex.class("Lp",iris[,1:2],iris[,5],r=1)
PPindex.class("PDA",iris[,1:2],iris[,5],lambda=0.1)




