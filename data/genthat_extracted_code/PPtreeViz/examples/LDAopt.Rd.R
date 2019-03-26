library(PPtreeViz)


### Name: LDAopt
### Title: PP optimization using LDA index
### Aliases: LDAopt
### Keywords: projection pursuit

### ** Examples

data(iris)
LDA.proj.result <- LDAopt(iris[,5],iris[,1:4])
LDA.proj.result$indexbest
LDA.proj.result$projbest



