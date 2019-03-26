library(ePCR)


### Name: score.cindex
### Title: Scoring function for evaluating survival prediction through
###   concordance index (c-index)
### Aliases: score.cindex

### ** Examples

# A random prediction ought to be near 0.5
# c-index is not sensitive to time scale, as it tests pairwise prediction accuracy
set.seed(1); prediction <- sample(1:20)
time <- seq(from=1000, to=50, by=-50)
event <- c(0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1)
library(survival)
score.cindex(pred = prediction, real = Surv(time=time, event=event))



