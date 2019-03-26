library(rrcovHD)


### Name: RSimca
### Title: Robust classification in high dimensions based on the SIMCA
###   method
### Aliases: RSimca RSimca.default RSimca.formula
### Keywords: robust multivariate

### ** Examples

data(pottery)
dim(pottery)        # 27 observations in 2 classes, 6 variables
head(pottery)

## Build the SIMCA model. Use RSimca for a robust version
rs <- RSimca(origin~., data=pottery)
rs
summary(rs)


## generate a sample from the pottery data set -
##  this will be the "new" data to be predicted
smpl <- sample(1:nrow(pottery), 5)
test <- pottery[smpl, -7]          # extract the test sample. Remove the last (grouping) variable
print(test)


## predict new data
pr <- predict(rs, newdata=test)

pr@classification 



