library(ashr)


### Name: pcdf_post
### Title: pcdf_post
### Aliases: pcdf_post

### ** Examples

beta = rnorm(100,0,1)
betahat= beta+rnorm(100,0,1)
sebetahat=rep(1,100)
ash.beta = ash(betahat,1,mixcompdist="normal")
c = pcdf_post(get_fitted_g(ash.beta),beta,set_data(betahat,sebetahat))



