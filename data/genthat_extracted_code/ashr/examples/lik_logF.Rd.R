library(ashr)


### Name: lik_logF
### Title: Likelihood object for logF error distribution
### Aliases: lik_logF

### ** Examples

   e = rnorm(100) + log(rf(100,df1=10,df2=10)) # simulate some data with log(F) error
   ash(e,1,lik=lik_logF(df1=10,df2=10))



