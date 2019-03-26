library(lfstat)


### Name: MAM
### Title: Mean Annual Minimum
### Aliases: MAM
### Keywords: MAM mean annual minimum

### ** Examples

data(ngaruroro)
MAM(ngaruroro)
MAM(ngaruroro, n=1) #Mean annual minimum
MAM(ngaruroro, year = c(1991,1995)) #Taking values from 1991 and 1995
MAM(ngaruroro, year = 1991:1995) #Taking values from 1991 to 1995 (1991,1992,...,1995)
MAM(ngaruroro, breakdays = c("01/11","01/05"))
MAM(ngaruroro, year = 1991)



