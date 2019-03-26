library(vtreat)


### Name: buildEvalSets
### Title: Build set carve-up for out-of sample evaluation.
### Aliases: buildEvalSets

### ** Examples


# use
buildEvalSets(200)

# longer example
# helper fns
# fit models using experiment plan to estimate out of sample behavior
fitModelAndApply <- function(trainData,applicaitonData) {
   model <- lm(y~x,data=trainData)
   predict(model,newdata=applicaitonData)
}
simulateOutOfSampleTrainEval <- function(d,fitApplyFn) {
   eSets <- buildEvalSets(nrow(d))
   evals <- lapply(eSets, 
      function(ei) { fitApplyFn(d[ei$train,],d[ei$app,]) })
   pred <- numeric(nrow(d))
   for(eii in seq_len(length(eSets))) {
     pred[eSets[[eii]]$app] <- evals[[eii]]
   }
   pred
}

# run the experiment
set.seed(2352356)
# example data
d <- data.frame(x=rnorm(5),y=rnorm(5),
        outOfSampleEst=NA,inSampleEst=NA)
        
# fit model on all data
d$inSampleEst <- fitModelAndApply(d,d)
# compute in-sample R^2 (above zero, falsely shows a 
#   relation until we adjust for degrees of freedom)
1-sum((d$y-d$inSampleEst)^2)/sum((d$y-mean(d$y))^2)

d$outOfSampleEst <- simulateOutOfSampleTrainEval(d,fitModelAndApply)
# compute out-sample R^2 (not positive, 
#  evidence of no relation)
1-sum((d$y-d$outOfSampleEst)^2)/sum((d$y-mean(d$y))^2)




