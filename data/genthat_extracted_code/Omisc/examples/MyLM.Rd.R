library(Omisc)


### Name: MyLM
### Title: MyLM
### Aliases: MyLM

### ** Examples

X<-DFSimulated(100,100,.4,.4)
Y<-RK(X[,1],X[,2],X[,3])
MyLM(Y[,1],Y[,c(2:3)],TRUE)



