library(NSM3)


### Name: cHollBivSym
### Title: Hollander Bivariate Symmetry
### Aliases: cHollBivSym
### Keywords: Hollander Bivariate Symmetry

### ** Examples

##Hollander-Wolfe-Chicken Example 3.11 Insulin Clearance in Kidney Transplants
x<-c(61.4,63.3,63.7,80,77.3,84,105)
y<-c(70.8,89.2,65.8,67.1,87.3,85.1,88.1)
obs.data<-cbind(x,y)
a.vec<-apply(obs.data,1,min)
b.vec<-apply(obs.data,1,max)
test<-function(r,c) {as.numeric((a.vec[c]<b.vec[r])&&(b.vec[r]<=b.vec[c])&&(a.vec[r]<=a.vec[c]))}
myVecFun <- Vectorize(test,vectorize.args = c('r','c')) 

d.mat<-outer(1:length(x), 1:length(x), FUN=myVecFun) 

##Cutoff based on the exact distribution
cHollBivSym(.10,d.mat)




