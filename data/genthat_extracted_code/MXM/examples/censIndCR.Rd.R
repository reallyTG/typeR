library(MXM)


### Name: Conditional independence tests for survival data 
### Title: Conditional independence test for survival data
### Aliases: censIndCR censIndWR censIndER permCR permWR permER waldCR
###   waldWR waldER
### Keywords: Survival Cox regression Weibull regression exponential
###   regression Log likelihood ratio Conditional independence test

### ** Examples

#create a survival simulated dataset
dataset <- matrix(runif(1000 * 20, 1, 100), nrow = 1000 , ncol = 20)
dataset <- as.data.frame(dataset);
timeToEvent <- numeric(1000)
event <- numeric(1000)
ca <- numeric(1000)
for(i in 1:1000) {
  timeToEvent[i] <- dataset[i, 1] + 0.5 * dataset[i, 10] + 2 * dataset[i, 15] + runif(1, 0, 3);
  event[i] <- sample( c(0, 1), 1)
  ca[i] <- runif(1, 0, timeToEvent[i] - 0.5)
  if(event[i] == 0)   timeToEvent[i] = timeToEvent[i] - ca[i]
}

require(survival, quietly = TRUE)

#init the Surv object class feature
target <- Surv(time = timeToEvent, event = event)
#run the censIndCR   conditional independence test
censIndCR( target, dataset, xIndex = 12, csIndex = c(5, 7, 4) )
# run the SESC algorithm 
## Not run: 
##D ses1 <- SES(target, dataset, max_k = 1, threshold = 0.05, test = "censIndCR");
##D ses2 <- SES(target, dataset, max_k = 1, threshold = 0.05, test = "censIndWR");
## End(Not run)



