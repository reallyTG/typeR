library(ashr)


### Name: cdf_post
### Title: cdf_post
### Aliases: cdf_post

### ** Examples

beta = rnorm(100,0,1)
betahat= beta+rnorm(100,0,1)
sebetahat=rep(1,100)
ash.beta = ash(betahat,1,mixcompdist="normal")
cdf0 = cdf_post(ash.beta$fitted_g,0,set_data(betahat,sebetahat))
graphics::plot(cdf0,1-get_pp(ash.beta))



