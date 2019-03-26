library(psych)


### Name: iclust.diagram
### Title: Draw an ICLUST hierarchical cluster structure diagram
### Aliases: iclust.diagram ICLUST.diagram
### Keywords: multivariate cluster hplot

### ** Examples

v9 <- sim.hierarchical()
v9c <- ICLUST(v9)
test.data <- Harman74.cor$cov
ic.out <- ICLUST(test.data)
#now show how to relabel clusters
ic.bfi <- iclust(bfi[1:25],beta=3) #find the clusters
cluster.names <- rownames(ic.bfi$results) #get the old names
#change the names to the desired ones
cluster.names[c(16,19,18,15,20)] <- c("Neuroticism","Extra-Open","Agreeableness",
      "Conscientiousness","Open")
#now show the new names
iclust.diagram(ic.bfi,cluster.names=cluster.names,min.size=4,e.size=1.75)




