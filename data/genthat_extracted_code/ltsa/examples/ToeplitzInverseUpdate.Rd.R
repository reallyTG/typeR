library(ltsa)


### Name: ToeplitzInverseUpdate
### Title: Inverse of Toeplitz matrix of order n+1 given inverse of order n
### Aliases: ToeplitzInverseUpdate
### Keywords: ts array

### ** Examples

#In this example we compute the update inverse directly and using ToeplitzInverseUpdate and
#compare the result.
phi<-0.8
sde<-30
n<-30
r<-arima.sim(n=30,list(ar=phi),sd=sde)
r<-phi^(0:(n-1))/(1-phi^2)*sde^2
n1<-25
G<-toeplitz(r[1:n1])
GI<-solve(G) #could also use TrenchInverse
GIupdate<-ToeplitzInverseUpdate(GI,r[1:n1],r[n1+1])
GIdirect<-solve(toeplitz(r[1:(n1+1)]))
ERR<-sum(abs(GIupdate-GIdirect))
ERR



