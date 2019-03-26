library(ePCR)


### Name: score.iAUC
### Title: Scoring function for evaluating survival prediction by time-wise
###   integrated AUC
### Aliases: score.iAUC

### ** Examples

# A random prediction ought to be near 0.5 
# iAUC is sensitive to the choice of time points to test AUC at
set.seed(1); prediction <- sample(1:20)
time <- seq(from=1000, to=50, by=-50)
event <- c(0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1)
library(survival)
score.iAUC(pred = prediction, real = Surv(time=time, event=event))



