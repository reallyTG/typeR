library(RPEXE.RPEXT)


### Name: loopcuts_onestep
### Title: Change-point p-values at given time points
### Aliases: loopcuts_onestep

### ** Examples

data(loopcuts_t_c)
time = loopcuts_t_c[,1]
censor = loopcuts_t_c[,2]
loopcuts_onestep(time, censor, 28.03013699, 1)




