library(dpcR)


### Name: show-methods
### Title: Methods for Function 'show'
### Aliases: show-methods show,dpcr-method show
### Keywords: methods utilities

### ** Examples


#array dpcr
ptest <- sim_adpcr(400, 765, 5, FALSE, n_panels = 1)
show(ptest)

#multiple experiments
ptest <- sim_adpcr(400, 765, 5, FALSE, n_panels = 5)
show(ptest)

#droplet dpcr - fluorescence
dropletf <- sim_dpcr(7, 20, times = 5, fluo = list(0.1, 0))
show(dropletf)

#droplet dpcr - number of molecules
droplet <- sim_dpcr(7, 20, times = 5)
show(droplet)




