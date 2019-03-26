library(EasyMARK)


### Name: Lifespan
### Title: minimum lifespan
### Aliases: Lifespan
### Keywords: utilities

### ** Examples


#' set up variables to be used by Simulate.CH for ten individuals
N = 10 
x1 = rnorm(N) #' each trait is normally distributed

#' Run Simulate.CH with a constant recapture probability
chObj = Simulate.CH(surv.form = 1 + 0.15*x1, p.constant = 1, N = N)

attributes(chObj) #' see what is inside our object
ch_matrix = chObj$ch_split #' grab our matrix from the list
ch_matrix #' lets look at it

ch_df = chObj$ch #' lets grab a data.frame also
ch_df 

#' we can compute the minimum lifespan on either a matrix or a data.frame as input
Lifespan(ch_matrix) #' on a matrix
Lifespan(ch_df) #' on a data.frame





