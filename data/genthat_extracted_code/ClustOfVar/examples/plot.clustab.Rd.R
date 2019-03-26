library(ClustOfVar)


### Name: plot.clustab
### Title: Plot of an index of stability of partitions of variables
### Aliases: plot.clustab

### ** Examples

data(decathlon)
tree <- hclustvar(X.quanti=decathlon[,1:10])
stab<-stability(tree,B=20)
plot(stab,nmax=7)




