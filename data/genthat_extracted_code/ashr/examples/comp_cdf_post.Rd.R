library(ashr)


### Name: comp_cdf_post
### Title: comp_cdf_post
### Aliases: comp_cdf_post

### ** Examples

beta = rnorm(100,0,1)
betahat= beta+rnorm(100,0,1)
sebetahat=rep(1,100)
ash.beta = ash(betahat,1,mixcompdist="normal")
comp_cdf_post(get_fitted_g(ash.beta),0,data=set_data(beta,sebetahat))



