library(xyz)


### Name: xyz_search
### Title: Interaction search
### Aliases: xyz_search

### ** Examples

n<-300
p<-1000
#construct a binary matrix
X<-matrix(sample(c(-1,1),replace=TRUE,n*p),n,p)
#set an interaction of the pair (1,2)
Y<-X[,1]*X[,2]+rnorm(n)
#run the interaction search
result<-xyz_search(X,Y,L=10,N=10,binary=TRUE,negative=TRUE)
#print the result
print(result)



