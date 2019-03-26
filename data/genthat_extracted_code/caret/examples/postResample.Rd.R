library(caret)


### Name: defaultSummary
### Title: Calculates performance across resamples
### Aliases: defaultSummary postResample twoClassSummary prSummary
###   getTrainPerf mnLogLoss R2 RMSE multiClassSummary MAE
### Keywords: utilities

### ** Examples


predicted <-  matrix(rnorm(50), ncol = 5)
observed <- rnorm(10)
apply(predicted, 2, postResample, obs = observed)

classes <- c("class1", "class2")
set.seed(1)
dat <- data.frame(obs =  factor(sample(classes, 50, replace = TRUE)),
                  pred = factor(sample(classes, 50, replace = TRUE)),
                  class1 = runif(50))
dat$class2 <- 1 - dat$class1            

defaultSummary(dat, lev = classes)
twoClassSummary(dat, lev = classes)
prSummary(dat, lev = classes)
mnLogLoss(dat, lev = classes)




