library(mrgsolve)


### Name: data_qsim
### Title: Create a matrix of events and observations for simulation
### Aliases: data_qsim

### ** Examples

e <- ev(amt = 100, ii = 12, addl = 2, rate = 50)

times <- tgrid(end = 240, delta = 6)

data_qsim(e, times)





