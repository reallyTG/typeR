library(cpm)


### Name: processStream
### Title: Detects Multiple Change Points in a Sequence
### Aliases: processStream

### ** Examples

     ## Use a Student-t CPM to detect several mean shift in a stream of 
     ## Gaussian random variables
     x <- c(rnorm(100,0,1),rnorm(100,1,1), rnorm(100,0,1), rnorm(100,-1,1))
     result <- processStream(x,"Student",ARL0=500,startup=20)
     plot(x)
     for (i in 1:length(result$changePoints)) {
         abline(v=result$changePoints[i], lty=2)
     }

     ## Use a Mood CPM to detect several scale shifts in a stream of 
     ##Student-t random variables
     x <- c(rt(100,3),rt(100,3)*2, rt(100,3), rt(100,3)*2)
     result <- processStream(x,"Mood",ARL0=500,startup=20)
     plot(x)
     for (i in 1:length(result$changePoints)) {
         abline(v=result$changePoints[i], lty=2)
     }
     
     ## Use a FET CPM to detect several parameter shifts in a stream of 
     ## Bernoulli observations. In this case, the lambda parameter acts to 
     ## reduce the discreteness of the test statistic.
     x <- c(rbinom(300,1,0.1),rbinom(300,1,0.4), rbinom(300,1,0.7))
     result <- processStream(x,"FET",ARL0=500,startup=20,lambda=0.3)
     plot(x)
     for (i in 1:length(result$changePoints)) {
         abline(v=result$changePoints[i], lty=2)
     }
     


