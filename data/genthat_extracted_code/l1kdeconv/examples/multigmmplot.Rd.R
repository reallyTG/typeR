library(l1kdeconv)


### Name: multigmmplot
### Title: Plot the Fit Results of aggregate 2-Component Gaussian Mixture
###   Model
### Aliases: multigmmplot
### Keywords: distribution

### ** Examples

params=list(
 c(mu1=0, mu2=10, sd = 1)
 , c(mu1=10, mu2=20, sd = 1)
 )

set.seed(0)
x=lapply(
  params
  , function(v) {
    c(
      rnorm(100, mean=v[['mu1']], sd = v[['sd']])
      , rnorm(50, mean=v[['mu2']], sd = v[['sd']])
      )
  }
  )
multigmmplot(x, multigmmsamedistribu(x))



