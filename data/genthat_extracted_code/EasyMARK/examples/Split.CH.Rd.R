library(EasyMARK)


### Name: Split.CH
### Title: Split a capture history data.frame
### Aliases: Split.CH
### Keywords: utilities

### ** Examples



#' set up variables to be used by Simulate.CH for ten individuals
N = 10 
x1 = rnorm(N) #' each trait is normally distributed

#' Run Simulate.CH with a constant recapture probability
chObj = Simulate.CH(surv.form = 1 + 0.15*x1, p.constant = 1, N = N)
str(chObj)
ch = chObj$ch #' grab our data.frame
ch #' it isn't split

Split.CH(ch) #' returns a matrix




