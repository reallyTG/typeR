library(CollocInfer)


### Name: IntegrateForward
### Title: IntegrateForward
### Aliases: IntegrateForward

### ** Examples

proc = make.SSEproc()
proc$more = make.fhn()
proc$more$names = c('V','R')

y0 = c(-1,1)
names(y0) = c('V','R')

pars = c(0.2,0.2,3)
names(pars) = c('a','b','c')

ts = seq(0,20,0.5)

value = IntegrateForward(y0,ts,pars,proc)

matplot(value$times,value$states)



