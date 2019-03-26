library(ashr)


### Name: vcdf_post
### Title: vcdf_post
### Aliases: vcdf_post

### ** Examples

beta = rnorm(100,0,1)
betahat= beta+rnorm(100,0,1)
sebetahat=rep(1,100)
ash.beta = ash(betahat,1,mixcompdist="normal")
c = vcdf_post(get_fitted_g(ash.beta),seq(-5,5,length=1000),data = set_data(betahat,sebetahat))



