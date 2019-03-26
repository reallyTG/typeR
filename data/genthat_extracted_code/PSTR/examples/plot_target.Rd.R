library(PSTR)


### Name: plot_target
### Title: Plot the surface of the target function for the nonlinear least
###   square estimation.
### Aliases: plot_target
### Keywords: utils

### ** Examples

## No test: 
pstr = NewPSTR(Hansen99, dep='inva', indep=4:20, indep_k=c('vala','debta','cfa','sales'),
    tvars=c('vala'), iT=14) # create a new PSTR object

# build the grid based on the first two parameters
ret = plot_target(obj=pstr,iq=1,basedon=c(1,2),from=c(log(1),6),
  to=c(log(18),10),length.out=c(40,40))
## End(No test)




