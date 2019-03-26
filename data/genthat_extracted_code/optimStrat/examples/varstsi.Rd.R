library(optimStrat)


### Name: varstsi
### Title: Variance of STSI Sampling with the HT Estimator
### Aliases: varstsi
### Keywords: survey

### ** Examples

x<- 1 + sort( rgamma(5000, shape=4/9, scale=108) ) #simulating the auxiliary variable
y<- rgamma(x, shape=1, scale=x) #simulating the study variable

st1<- rep(1:5, each=1000) #defining the strata
z1<- varstsi(n=500, x=x, y=y, stratum=st1)
z1$variance

st2<- stratify(x, H=5) #A better way to stratify
z2<- varstsi(n=500, x=x, y=y, stratum=st2)
z2$variance



