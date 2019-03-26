library(icRSF)


### Name: simout
### Title: Simulate error-prone test results for a user-defined vector of
###   test times for each of the N subjects, for a user input NxP design
###   matrix (Xmat).
### Aliases: simout

### ** Examples

data(Xmat)
sim <- simout(Xmat, testtimes=1:4, sensitivity=1, specificity=1, noevent=0.7, 
              betas=c(rep(0.81, 5), rep(0, ncol(Xmat)-5)), design="NTFP")



