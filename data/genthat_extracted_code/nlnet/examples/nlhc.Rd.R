library(nlnet)


### Name: nlhc
### Title: Non-Linear Hierarchical Clustering
### Aliases: nlhc

### ** Examples

 ## generating the data matrix & hiden clusters as a sample
 input<-data.gen(n.genes=40, n.grps=4)
 ## now input includes data matrix and hiden clusters, so get the matrix as input.
 input<-input$data

 nlhc.data<-nlhc(input)
 plot(nlhc.data)
 ##get the merge from the input.
 merge<-nlhc.data$merge 



