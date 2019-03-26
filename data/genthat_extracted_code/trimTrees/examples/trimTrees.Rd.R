library(trimTrees)


### Name: trimTrees
### Title: Trimmed Opinion Pools of Trees in Random Forest
### Aliases: trimTrees
### Keywords: classif randomForest regression tree

### ** Examples

# Load the data
set.seed(201) # Can be removed; useful for replication
data <- as.data.frame(mlbench.friedman1(500, sd=1))
summary(data)

# Prepare data for trimming
train <- data[1:400, ]
test <- data[401:500, ]
xtrain <- train[,-11]  
ytrain <- train[,11]
xtest <- test[,-11]
ytest <- test[,11]
      
# Option 1. Run trimTrees with responses in testing set.
set.seed(201) # Can be removed; useful for replication
tt1 <- trimTrees(xtrain, ytrain, xtest, ytest, trim=0.15)

#Some outputs from trimTrees: scores, hit rates, PIT densities.
colMeans(tt1$trimmedEnsembleScores)
colMeans(tt1$untrimmedEnsembleScores)
mean(hitRate(tt1$treePITs))
hitRate(tt1$trimmedEnsemblePITs)
hitRate(tt1$untrimmedEnsemblePITs)
hist(tt1$trimmedEnsemblePITs, prob=TRUE)
hist(tt1$untrimmedEnsemblePITs, prob=TRUE)

# Option 2. Run trimTrees without responses in testing set. 
# In this case, scores, PITs, or hit rates will not be available.
set.seed(201) # Can be removed; useful for replication
tt2 <- trimTrees(xtrain, ytrain, xtest, trim=0.15)

# Some outputs from trimTrees: cdfs for last test value.
plot(tt2$trimmedEnsembleCDFs[100,],type="l",col="red",ylab="cdf",xlab="y") 
lines(tt2$untrimmedEnsembleCDFs[100,])
legend(275,0.2,c("trimmed", "untrimmed"),col=c("red","black"),lty = c(1, 1))
title("CDFs of Trimmed and Untrimmed Ensembles")

# Compare the CDF and moment approaches to trimming the trees.
ttCDF <- trimTrees(xtrain, ytrain, xtest, trim=0.15, methodIsCDF=TRUE)
ttMA <- trimTrees(xtrain, ytrain, xtest, trim=0.15, methodIsCDF=FALSE)
plot(ttCDF$trimmedEnsembleCDFs[100,], type="l", col="red", ylab="cdf", xlab="y") 
lines(ttMA$trimmedEnsembleCDFs[100,])
legend(275,0.2,c("CDF Approach", "Moment Approach"), col=c("red","black"),lty = c(1, 1))
title("CDFs of Trimmed Ensembles")



