library(epimdr)


### Name: tau
### Title: Gillespie tau-leap algorithm
### Aliases: tau

### ** Examples

rlist2=c(quote(mu * (S+E+I+R)), quote(mu * S), quote(beta * S * I/(S+E+I+R)), 
 quote(mu*E), quote(sigma * E), quote(mu * I), quote(gamma * I), quote(mu*R))
emat2=matrix(c(1,0,0,0,-1,0,0,0,-1,1,0,0,0,-1,0,0,0,-1,1,0,0,0,-1,0,0,0,-1,1,0,0,0,-1),
ncol=4, byrow=TRUE)
paras  = c(mu = 1, beta =  1000, sigma = 365/8, gamma = 365/5)
inits = c(S=999, E=0, I=1, R = 0)
sim2=tau(rlist2, emat2, paras, inits, 1/365, 1)



