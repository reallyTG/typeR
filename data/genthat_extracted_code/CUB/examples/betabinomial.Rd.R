library(CUB)


### Name: betabinomial
### Title: Beta-Binomial probabilities of ordinal responses, with feeling
###   and overdispersion parameters for each observation
### Aliases: betabinomial
### Keywords: distribution

### ** Examples

data(relgoods)
m<-10
ordinal<-relgoods$Tv
age<-2014-relgoods$BirthYear
no_na<-na.omit(cbind(ordinal,age))
ordinal<-no_na[,1]; age<-no_na[,2]
lage<-log(age)-mean(log(age))
gama<-c(-0.6, -0.3)
csivett<-logis(lage,gama)
alpha<-c(-2.3,0.92); 
ZZ<-cbind(1,lage)
phivett<-exp(ZZ%*%alpha)
pr<-betabinomial(m,ordinal,csivett,phivett)
plot(density(pr))



