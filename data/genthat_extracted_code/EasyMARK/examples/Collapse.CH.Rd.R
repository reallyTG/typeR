library(EasyMARK)


### Name: Collapse.CH
### Title: Collapse a capture history matrix
### Aliases: Collapse.CH
### Keywords: utilities

### ** Examples


#' set up variables to be used by Simulate.CH for ten individuals
N = 10 
x1 = rnorm(N) #' each trait is normally distributed

#' Run Simulate.CH with a constant recapture probability
chObj = Simulate.CH(surv.form = 1 + 0.15*x1, p.constant = 1, N = N)

attributes(chObj) #' see what is inside our object
ch = chObj$ch_split #' grab our matrix from the list
ch #' lets look at it

Collapse.CH(ch) #' now let's turn it into a data.frame





