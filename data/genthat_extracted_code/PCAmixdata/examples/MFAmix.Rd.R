library(PCAmixdata)


### Name: MFAmix
### Title: Multiple factor analysis of mixed data
### Aliases: MFAmix
### Keywords: multivariate, mixed type data, data structured in groups

### ** Examples

data(gironde)

class.var<-c(rep(1,9),rep(2,5),rep(3,9),rep(4,4))
names <- c("employment","housing","services","environment")

dat<-cbind(gironde$employment[1:20,],gironde$housing[1:20,],
      gironde$services[1:20,],gironde$environment[1:20,])
      
res<-MFAmix(data=dat,groups=class.var,
      name.groups=names, rename.level=TRUE, ndim=3,graph=FALSE)
      
summary(res)




