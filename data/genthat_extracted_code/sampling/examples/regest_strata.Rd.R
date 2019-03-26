library(sampling)


### Name: regest_strata
### Title: The regression estimator for a stratified design
### Aliases: regest_strata
### Keywords: survey

### ** Examples

# generates artificial data
y=rgamma(10,3)
x=y+rnorm(10)
Stratum=c(1,1,2,2,2,3,3,3,3,3)
# population size
N=200
# sample size
n=10
# assume proportional allocation, nh/Nh=n/N 
pikl=matrix(0,n,n)
for(i in 1:n)
 {for(j in 1:n)
  if(i!=j)
      pikl[i,j]=pikl[j,i]=n*(n-1)/(N*(N-1))
  pikl[i,i]=n/N
  }
regest_strata(formula=y~x-1,weights=rep(N/n,n),Tx_strata=c(50,30,40),
strata=Stratum,pikl,description=TRUE)



