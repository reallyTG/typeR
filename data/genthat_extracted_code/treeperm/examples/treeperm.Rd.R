library(treeperm)


### Name: treeperm
### Title: Permutation Tests Using Tree Algorithms
### Aliases: treeperm treeperm.formula treeperm.default print.treeperm
###   summary.treeperm print.summary.treeperm

### ** Examples

value<-c(0,190,0,0,10,0,0,0,0,0,0,110,0,0,52,0,8,0,50,0,0,137,965,110)
label<-as.factor(c(1,1,1,2,2,2,1,1,1,2,2,2,1,1,1,2,2,2,1,1,1,2,2,2))
data<-data.frame(label,value)
exact<-treeperm(value~label,frame=data,type="exact")
summary(exact)
approximate<-treeperm(value~label,frame=data,type="approximate",size=999)
summary(approximate)



