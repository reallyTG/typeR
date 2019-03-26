library(trimTrees)


### Name: hitRate
### Title: Empirical Hit Rates for a Crowd of Forecasters
### Aliases: hitRate
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
      
# Run trimTrees
set.seed(201) # Can be removed; useful for replication
tt <- trimTrees(xtrain, ytrain, xtest, ytest, trim=0.15)

# Outputs from trimTrees
mean(hitRate(tt$treePITs))
hitRate(tt$trimmedEnsemblePITs)
hitRate(tt$untrimmedEnsemblePITs)



