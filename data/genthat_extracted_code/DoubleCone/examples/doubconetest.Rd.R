library(DoubleCone)


### Name: doubconetest
### Title: Test for a vector being in the null space of a double cone
### Aliases: doubconetest
### Keywords: monotone regression hypothesis test cone projection

### ** Examples

## test against a constant function
n=100
x=1:n/n
mu=4-5*(x-1/2)^2
y=mu+rnorm(n)
amat=matrix(0,nrow=n-1,ncol=n)
for(i in 1:(n-1)){amat[i,i]=-1;amat[i,i+1]=1}
ans=doubconetest(y,amat)
ans$pval
plot(x,y,col="slategray");lines(x,mu,lty=3,col=3)
lines(x,ans$p1,col=2)
lines(x,ans$p2,col=4)



