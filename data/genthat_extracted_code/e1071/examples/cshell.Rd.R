library(e1071)


### Name: cshell
### Title: Fuzzy C-Shell Clustering
### Aliases: cshell
### Keywords: cluster

### ** Examples

## a 2-dimensional example
x<-rbind(matrix(rnorm(50,sd=0.3),ncol=2),
         matrix(rnorm(50,mean=1,sd=0.3),ncol=2))
cl<-cshell(x,2,20,verbose=TRUE,method="cshell",m=2)
print(cl)

# assign classes to some new data
y<-rbind(matrix(rnorm(13,sd=0.3),ncol=2),
         matrix(rnorm(13,mean=1,sd=0.3),ncol=2))
#         ycl<-predict(cl, y, type="both")
        


