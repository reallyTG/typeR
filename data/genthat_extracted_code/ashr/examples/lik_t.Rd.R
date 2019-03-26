library(ashr)


### Name: lik_t
### Title: Likelihood object for t error distribution
### Aliases: lik_t

### ** Examples

   z = rnorm(100) + rt(100,df=4) # simulate some data with t error
   ash(z,1,lik=lik_t(df=4))



