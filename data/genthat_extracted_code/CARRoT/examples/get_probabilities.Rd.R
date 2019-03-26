library(CARRoT)


### Name: get_probabilities
### Title: Probabilities for multinomial regression
### Aliases: get_probabilities

### ** Examples

trset<-matrix(c(rbinom(70,1,0.5),runif(70,0.1)),ncol=2)

testset<-matrix(c(rbinom(10,1,0.5),runif(10,0.1)),ncol=2)

get_probabilities(trset,testset,rbinom(70,1,0.6),'binary')



