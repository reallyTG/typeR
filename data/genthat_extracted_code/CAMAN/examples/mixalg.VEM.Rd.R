library(CAMAN)


### Name: mixalg.VEM
### Title: VEM algorithm
### Aliases: mixalg.VEM
### Keywords: meta-analysis

### ** Examples

data(vitA)
m0<-mixalg.VEM(obs="logrr",var.lnOR="var",family="gaussian", data=vitA,startk=20)
plot(m0@totalgrid[,2],m0@totalgrid[,3],type="l",xlab="parameter",ylab="gradient")
m1<-mixalg.EM(obs="logrr",var.lnOR="var" ,family="gaussian",p=c(1),t=c(0),data=vitA)



