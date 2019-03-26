library(SAutomata)


### Name: BaumWelch
### Title: Inferring the Forward and Backward Probabilities of a Stochastic
###   Automata Model via the Baum-Welch algorithm
### Aliases: BaumWelch

### ** Examples

states<-c('s1','s2')
inputSymbols<-c('a','b')
outputSymbols<-c(0,1)
transProb<-matrix(c(0.70,0.50, 0.30,0.50), nrow = 2, ncol = 2,byrow = TRUE)
emissionProb<-matrix(c(0.50,0.30, 0.40,0.60,.50,.70,.60,.40), nrow = 2, ncol = 4, byrow = TRUE)
initsa<-initSA(states,inputSymbols,outputSymbols,emissionProb,transProb)
x<-c('b','a')
y<-c(0,1)
m<-1
error<-10
BaumWelch(initsa, x, y, m, error)



