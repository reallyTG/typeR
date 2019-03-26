library(epimdr)


### Name: gillespie
### Title: Gillespie exact algorithm
### Aliases: gillespie

### ** Examples

rlist=c(quote(mu * (S+I+R)), quote(mu * S), quote(beta * S * I /(S+I+R)), 
 quote(mu * I), quote(gamma * I), quote(mu*R))
emat=matrix(c(1,0,0,-1,0,0,-1,1,0,0,-1,0,0,-1,1,0,0,-1),ncol=3, byrow=TRUE)
paras  = c(mu = 1, beta =  1000, gamma = 365/20)
inits = c(S=100, I=2, R=0)
sim=gillespie(rlist, emat, paras, inits, 100)



