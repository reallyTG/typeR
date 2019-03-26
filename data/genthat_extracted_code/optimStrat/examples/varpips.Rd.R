library(optimStrat)


### Name: varpips
### Title: Variance of Pareto PIps Sampling with the HT Estimator
### Aliases: varpips
### Keywords: survey

### ** Examples

x<- 1 + sort( rgamma(5000, shape=4/9, scale=108) ) #simulating the auxiliary variable
y<- rgamma(x, shape=1, scale=x) #simulating the study variable
z<- varpips(n=500, x=x, y=y)
z$variance



