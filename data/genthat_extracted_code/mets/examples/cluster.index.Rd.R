library(mets)


### Name: cluster.index
### Title: Finds subjects related to same cluster
### Aliases: cluster.index

### ** Examples

i<-c(1,1,2,2,1,3)
d<- cluster.index(i)
print(d)

type<-c("m","f","m","c","c","c")
d<- cluster.index(i,num=type,Rindex=1)
print(d)



