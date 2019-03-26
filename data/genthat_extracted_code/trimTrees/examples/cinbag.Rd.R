library(trimTrees)


### Name: cinbag
### Title: Modified Classification and Regression with Random Forest
### Aliases: cinbag
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
      
# Run cinbag
set.seed(201) # Can be removed; useful for replication
rf <- cinbag(xtrain, ytrain, ntree=500, nodesize=5, mtry=3, keep.inbag=TRUE)
rf$inbag[,1] # First tree's inbag indicators 
rf$inbagCount[,1] # First tree's inbag counts



