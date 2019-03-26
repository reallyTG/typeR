library(ClustOfVar)


### Name: stability
### Title: Stability of partitions from a hierarchy of variables
### Aliases: stability

### ** Examples

data(decathlon)
tree <- hclustvar(X.quanti=decathlon[,1:10])
stab<-stability(tree,B=20)
plot(stab,nmax=7)
boxplot(stab$matCR[,1:7])




