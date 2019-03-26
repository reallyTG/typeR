library(alineR)


### Name: optimization.GA
### Title: Core optimization function for finding optimal weights.
### Aliases: optimization.GA
### Keywords: ~kwd1 ~kwd2

### ** Examples

data<-as.matrix(data.frame(dog=c('dog','perro'),cat=c('cat','gato'),rat=c('rat','rata')))
M<-generate.training(raw.data=data,search.size=100,table=FALSE)
alignment<-rbind(M[[2]][4,],M[[2]][5,])
optimization.GA(Al=alignment,data=data,num=5,step=3,plot=FALSE)



