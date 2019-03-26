library(ipptoolbox)


### Name: tests
### Title: Construct pboxes
### Aliases: dskstest dsbelpltests

### ** Examples

data=rnorm(100,0.3,1.2)
intervaldata=cbind(data,data+runif(100,0,0.2))

mu=0; sigma=1
mu2=dsstruct(c(-0.5,0.5,1)); sigma2=dsstruct(c(1,2,1))
pbox=dsodf(qnorm,1000,mu2,sigma)

print("K-S result, pbox on data:")
ks=dskstest(data,pbox)
print(ks)
print("K-S result, precise mu, imprecise sigma on interval data:")
ks2=dskstest(intervaldata,pnorm,list(mu,sigma2))
print(ks2)



