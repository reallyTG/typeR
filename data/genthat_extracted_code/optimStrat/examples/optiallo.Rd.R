library(optimStrat)


### Name: optiallo
### Title: Optimal allocation in stratified simple random sampling
### Aliases: optiallo
### Keywords: survey

### ** Examples

x<- 1 + sort( rgamma(100, shape=4/9, scale=108) )
st1<- stratify(x,H=6)
optiallo(n=30,x,stratum=st1)

optiallo(n=30,x,H=6)



