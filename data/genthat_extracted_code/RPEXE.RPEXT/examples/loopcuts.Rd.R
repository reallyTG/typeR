library(RPEXE.RPEXT)


### Name: loopcuts
### Title: Change-point p-values with backward elimination
### Aliases: loopcuts

### ** Examples

data(loopcuts_t_c)
data(loopcuts_cut)
time = loopcuts_t_c[,1]
censor = loopcuts_t_c[,2]
loopcuts(time, censor, loopcuts_cut, 1)



