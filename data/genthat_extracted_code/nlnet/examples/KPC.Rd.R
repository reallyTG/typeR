library(nlnet)


### Name: KPC
### Title: implementation of K-Profiles Clustering
### Aliases: KPC

### ** Examples


 ## generating the data matrix & hiden clusters as a sample
 input<-data.gen(n.genes=40, n.grps=4)
 ## now input includes data matrix and hiden clusters, so get the matrix as input.
 input<-input$data
 
 ## set nCluster value to 4
 kpc<-KPC(input,nCluster=4)
  
 ##get the hiden cluster result from "KPC"
 cluster<-kpc$cluster
 ##get the list of p
 p<-kpc$p.list



