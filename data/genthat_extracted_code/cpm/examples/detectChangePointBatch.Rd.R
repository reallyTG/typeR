library(cpm)


### Name: detectChangePointBatch
### Title: Detect a Single Change Point in a Sequence
### Aliases: detectChangePointBatch

### ** Examples

     ## Use a Student-t CPM to detect a mean shift in a stream of Gaussian 
     ## random variables which occurs after the 100th observation
     x <- c(rnorm(100,0,1),rnorm(1000,1,1))
     detectChangePointBatch(x,"Student",alpha=0.05)


     ## Use a Mood CPM to detect a scale shift in a stream of Student-t 
     ## random variables which occurs after the 100th observation
     x <- c(rt(100,5),rt(1000,5*2))
     detectChangePointBatch(x,"Mood",alpha=0.05)

     ## Use a FET CPM to detect a parameter shift in a stream of Bernoulli 
     ##observations. In this case, the lambda parameter acts to reduce the 
     ##discreteness of the test statistic.
     x <- c(rbinom(100,1,0.2), rbinom(1000,1,0.5))
     detectChangePointBatch(x,"FET",alpha=0.05,lambda=0.3)
     


