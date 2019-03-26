library(discSurv)


### Name: concorIndex
### Title: Concordance Index
### Aliases: concorIndex
### Keywords: survival

### ** Examples


# Example with cross validation and unemployment data 
library(Ecdat)
library(caret)
data(UnempDur)

# Evaluation of short term prediction for re-employed at full-time job
# Last interval q=14
# -> Set all time points with spell > 13 to time interval 13 and censored
lastObsInterval <- 13
UnempDurSubset <- UnempDur
UnempDurSubset[UnempDurSubset$spell > lastObsInterval, "censor1"] <- 0
UnempDurSubset[UnempDurSubset$spell > lastObsInterval, "spell"] <- lastObsInterval
head(UnempDurSubset)
range(UnempDurSubset$spell)

# Select cross-validation samples
set.seed(7550)
CVfolds <- createFolds (y=UnempDurSubset$spell, returnTrain=TRUE, k=2)

# Continuation ratio model formula
contModForm <- spell ~ logwage + ui + logwage*ui + age

# Estimate true positive rate of time interval 6: 
# Correspondes to three and a half month duration (each interval is of length two weeks)
tryTPR <- tprUno (timepoint=6, dataSet=UnempDurSubset, trainIndices=CVfolds, 
survModelFormula=contModForm, censModelFormula=censor1 ~ 1, 
linkFunc="logit", idColumn=NULL, timeAsFactor=FALSE)
tryTPR
plot(tryTPR)

# Estimate false positive rate of time interval 6:
tryFPR <- fprUno (timepoint=6, dataSet=UnempDurSubset, trainIndices=CVfolds,  
survModelFormula=contModForm, censModelFormula=censor1 ~ 1, 
linkFunc="logit", idColumn=NULL, timeAsFactor=FALSE)
tryFPR
plot(tryFPR)

# Estimate AUC rate of time interval 6:
tryAUC <- aucUno (tprObj=tryTPR, fprObj=tryFPR)
tryAUC
plot(tryAUC)

## Not run: 
##D # Estimate global concordance index:
##D tryConcorIndex <- concorIndex (tryAUC, printTimePoints=TRUE)
##D tryConcorIndex
##D summary(tryConcorIndex)
## End(Not run)



