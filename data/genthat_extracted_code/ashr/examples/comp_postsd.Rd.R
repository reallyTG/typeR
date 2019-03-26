library(ashr)


### Name: comp_postsd
### Title: comp_postsd
### Aliases: comp_postsd

### ** Examples

beta = rnorm(100,0,1)
betahat= beta+rnorm(100,0,1)
ash.beta = ash(betahat,1,mixcompdist="normal")
data= set_data(betahat,rep(1,100))
comp_postmean(get_fitted_g(ash.beta),data)
comp_postsd(get_fitted_g(ash.beta),data)
comp_postprob(get_fitted_g(ash.beta),data)



