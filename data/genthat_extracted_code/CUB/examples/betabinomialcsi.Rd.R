library(CUB)


### Name: betabinomialcsi
### Title: Beta-Binomial probabilities of ordinal responses, given feeling
###   parameter for each observation
### Aliases: betabinomialcsi
### Keywords: distribution

### ** Examples

data(relgoods)
m<-10
ordinal<-relgoods$Tv
age<-2014-relgoods$BirthYear
no_na<-na.omit(cbind(ordinal,age))
ordinal<-no_na[,1]; age<-no_na[,2]
lage<-log(age)-mean(log(age))
gama<-c(-0.61,-0.31)
phi<-0.16 
csivett<-logis(lage,gama)
pr<-betabinomialcsi(m,ordinal,csivett,phi)
plot(density(pr))



