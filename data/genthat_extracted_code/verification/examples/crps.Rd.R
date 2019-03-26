library(verification)


### Name: crps
### Title: Continuous Ranked Probability Score
### Aliases: crps
### Keywords: file

### ** Examples


#  probabilistic/ binary example


x <- runif(100) ## simulated observation.
crps(x, c(0,1))

## simulated forecast in which mean and sd differs for each forecast.
frcs<- data.frame( runif(100, -2, 2), runif(100, 1, 3 ) )
crps(x, frcs)




