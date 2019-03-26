library(landpred)


### Name: Wi.FUN
### Title: Computes the inverse probability of censoring weights for a
###   specific t0 and tau
### Aliases: Wi.FUN
### Keywords: IPCW survival

### ** Examples

data(data_example_landpred)
t0=2
tau = 8

W2i <- Wi.FUN(data_example_landpred[,1],data = data_example_landpred[,c(1:2)],t0=t0,tau=tau)





