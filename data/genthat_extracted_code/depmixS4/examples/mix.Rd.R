library(depmixS4)


### Name: mix
### Title: Mixture Model Specifiction
### Aliases: mix mix,ANY-method show,mix-method summary,mix-method
### Keywords: methods

### ** Examples


# four binary items on the balance scale task
data(balance)

# define a latent class model
instart=c(0.5,0.5)
set.seed(1)
respstart=runif(16)
# note that ntimes argument is used to make this a mixture model
mod <- mix(list(d1~1,d2~1,d3~1,d4~1), data=balance, nstates=2,
	family=list(multinomial(),multinomial(),multinomial(),multinomial()),
	respstart=respstart,instart=instart)
# to see the model
mod




