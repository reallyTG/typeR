library(pcIRT)


### Name: person_par.CRSM
### Title: Estimation of person parameters
### Aliases: person_par.CRSM person_par.MPRM person_par person_par.MPRM
###   person_par.CRSM
### Keywords: parameter person

### ** Examples


#estimate CRSM for the first four items
data(analog)
res_cr <- CRSM(extraversion, low=-10, high=10)

#estimate person parameters for CRSM
pp <- person_par(res_cr)





