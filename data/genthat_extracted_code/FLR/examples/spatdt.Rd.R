library(FLR)


### Name: spatdt
### Title: Spatial Data Handling
### Aliases: spatdt get.cost get.cost2 get.pos winner.route

### ** Examples

#Import data
data(dataset001)
data<-dataset001
data(mat)

idx<-1
rhoa<-0.6
param<-"sigmoid"
pre_order<-c(1,2,3,4,5,6,7,8,9)

#Data preprocess
data<-spatdt(data,idx,mat,pre_order)



