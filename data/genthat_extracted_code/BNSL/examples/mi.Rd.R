library(BNSL)


### Name: mi
### Title: Bayesian Estimation of Mutual Information
### Aliases: mi

### ** Examples

n=100

x=rbinom(n,1,0.5); y=rbinom(n,1,0.5); mi(x,y)

z=rbinom(n,1,0.1); y=(x+z)

mi(x,y); mi(x,y,proc=1); mi(x,y,2) 

x=rnorm(n); y=rnorm(n); mi(x,y,proc=10)

x=rnorm(n); z=rnorm(n); y=0.9*x+sqrt(1-0.9^2)*z; mi(x,y,proc=10)




