library(RPEXE.RPEXT)


### Name: loopcuts_umbrella
### Title: Change-point p-values with backward elimination under umbrella
###   alternative order restriction
### Aliases: loopcuts_umbrella

### ** Examples

data(loopcuts_t_c)
data(loopcuts_umbrella_cuttimes_mono)
time = loopcuts_t_c[,1]
censor = loopcuts_t_c[,2]
cuttimes = loopcuts_umbrella_cuttimes_mono[,1]
mono = loopcuts_umbrella_cuttimes_mono[,2]
loopcuts_umbrella(time, censor, cuttimes, mono)



