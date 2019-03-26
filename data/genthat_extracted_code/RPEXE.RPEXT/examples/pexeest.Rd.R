library(RPEXE.RPEXT)


### Name: pexeest
### Title: RPEXE estimate given change-points
### Aliases: pexeest

### ** Examples

data(pexeest_times_censoring)
data(t100)
times = pexeest_times_censoring[,1]
cens = pexeest_times_censoring[,2]
pexeest(times, cens, 28.03014, t100)




