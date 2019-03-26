library(dgo)


### Name: show,dgo_fit-method
### Title: 'print' method for 'dgo_fit-class' objects
### Aliases: show,dgo_fit-method print,dgo_fit-method print.dgo_fit
###   get_elapsed_time,dgo_fit-method summary,dgo_fit-method
###   get_posterior_mean,dgo_fit-method summarize summarize,dgo_fit-method
###   as.data.frame.dgo_fit rhats rhats,dgo_fit-method

### ** Examples

data(toy_dgirtfit)
summarize(toy_dgirtfit)
data(toy_dgirtfit)
# access posterior samples
as.data.frame(toy_dgirtfit, pars = 'theta_bar')
data(toy_dgirtfit)
rhats(toy_dgirtfit)



