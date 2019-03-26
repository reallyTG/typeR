library(PPtreeViz)


### Name: PDAopt
### Title: PP optimization using PDA index
### Aliases: PDAopt
### Keywords: projection pursuit

### ** Examples

data(iris)
PDA.proj.result <- PDAopt(iris[,5],iris[,1:4],weight=TRUE,q=2,lambda=0.1)
PDA.proj.result$indexbest
PDA.proj.result$projbest



