library(popbio)


### Name: multiresultm
### Title: Incorporate demographic stochasticity into population
###   projections
### Aliases: multiresultm
### Keywords: survey

### ** Examples

data(whale)
x<-splitA(whale)
whaleT<-x$T
whaleF<-x$F

multiresultm(c(1,9,9,9),whaleT, whaleF)
multiresultm(c(1,9,9,9),whaleT, whaleF)

## create graph similar to Fig 15.3 a
reps <- 10    # number of trajectories
tmax <- 200   # length of the trajectories
totalpop <- matrix(0,tmax,reps)  # initializes totalpop matrix to store trajectories
nzero <- c(1,1,1,1) # starting population size
for (j in 1:reps) 
{
   n <- nzero
   for (i in 1:tmax) 
   {
      n <- multiresultm(n,whaleT,whaleF)
      totalpop[i,j] <- sum(n)
   } 
} 
matplot(totalpop, type = 'l', log="y",
        xlab = 'Time (years)', ylab = 'Total population')



