library(msm)


### Name: crudeinits.msm
### Title: Calculate crude initial values for transition intensities
### Aliases: crudeinits.msm
### Keywords: models

### ** Examples

data(cav)
twoway4.q <- rbind(c(-0.5, 0.25, 0, 0.25), c(0.166, -0.498, 0.166, 0.166),
c(0, 0.25, -0.5, 0.25), c(0, 0, 0, 0))
statetable.msm(state, PTNUM, data=cav)
crudeinits.msm(state ~ years, PTNUM, data=cav, qmatrix=twoway4.q)



