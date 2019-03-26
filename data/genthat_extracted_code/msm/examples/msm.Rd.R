library(msm)


### Name: msm
### Title: Multi-state Markov and hidden Markov models in continuous time
### Aliases: msm
### Keywords: models

### ** Examples

### Heart transplant data
### For further details and background to this example, see
### Jackson (2011) or the PDF manual in the doc directory.
print(cav[1:10,])
twoway4.q <- rbind(c(-0.5, 0.25, 0, 0.25), c(0.166, -0.498, 0.166, 0.166),
c(0, 0.25, -0.5, 0.25), c(0, 0, 0, 0))
statetable.msm(state, PTNUM, data=cav)
crudeinits.msm(state ~ years, PTNUM, data=cav, qmatrix=twoway4.q)
cav.msm <- msm( state ~ years, subject=PTNUM, data = cav,
                 qmatrix = twoway4.q, deathexact = 4, 
                 control = list ( trace = 2, REPORT = 1 )  )
cav.msm
qmatrix.msm(cav.msm)
pmatrix.msm(cav.msm, t=10)
sojourn.msm(cav.msm)



