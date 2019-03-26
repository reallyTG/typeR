library(psych)


### Name: iclust
### Title: iclust: Item Cluster Analysis - Hierarchical cluster analysis
###   using psychometric principles
### Aliases: ICLUST iclust
### Keywords: multivariate cluster

### ** Examples

test.data <- Harman74.cor$cov
ic.out <- iclust(test.data,title="ICLUST of the Harman data")
summary(ic.out)

#use all defaults and stop at 4 clusters
ic.out4 <- iclust(test.data,nclusters =4,title="Force 4 clusters")  
summary(ic.out4)
ic.out1 <- iclust(test.data,beta=3,beta.size=3)  #use more stringent criteria
ic.out  #more complete output 
plot(ic.out4)    #this shows the spatial representation
#use a dot graphics viewer on the out.file
dot.graph <- ICLUST.graph(ic.out,out.file="test.ICLUST.graph.dot")  
 #show the equivalent of a factor solution 
fa.diagram(ic.out4$pattern,Phi=ic.out4$Phi,main="Pattern taken from iclust") 




