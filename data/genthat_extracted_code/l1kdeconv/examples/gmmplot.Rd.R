library(l1kdeconv)


### Name: gmmplot
### Title: Plot the Fit Results of 2-Component Gaussian Mixture Model
### Aliases: gmmplot
### Keywords: distribution

### ** Examples

set.seed(0)
x=list(c(
  rnorm(150, mean=0)
  , rnorm(50, mean=10)
  ))
fit_res=multigmmsamedistribu(x)

with(
  as.list(fit_res$par_conv)
  , gmmplot(x[[1]]
    , mu1=mu1
    , mu2=mu2
    , sigma=sigma
    , lambda=lambda
    , xlim=range(unlist(x))
    )
  )



