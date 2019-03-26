library(treeperm)


### Name: treeperm-package
### Title: Exact and Asymptotic K Sample Permutation Test
### Aliases: treeperm-package
### Keywords: Permutation treeperm

### ** Examples

value<-c(0,190,0,0,10,0,0,0,0,0,0,110,0,0,52,0,8,0,50,0,0,137,965,110)
label<-as.factor(c(1,1,1,2,2,2,1,1,1,2,2,2,1,1,1,2,2,2,1,1,1,2,2,2))
data<-data.frame(label,value)
exact<-treeperm(value~label,frame=data,type="exact")
exact
summary(exact)
approximate<-treeperm(value~label,frame=data,type="approximate",size=999)
approximate
summary(approximate)
plot(exact,size=999)



