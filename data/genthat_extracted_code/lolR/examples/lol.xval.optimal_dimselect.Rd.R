library(lolR)


### Name: lol.xval.optimal_dimselect
### Title: Optimal Cross-Validated Number of Embedding Dimensions
### Aliases: lol.xval.optimal_dimselect

### ** Examples

# train model and analyze with loo validation using lda classifier
library(lolR)
data <- lol.sims.rtrunk(n=200, d=30)  # 200 examples of 30 dimensions
X <- data$X; Y <- data$Y
# run cross-validation with the nearestCentroid method and
# leave-one-out cross-validation, which returns only
# prediction labels so we specify classifier.return as NaN
xval.fit <- lol.xval.optimal_dimselect(X, Y, rs=c(5, 10, 15), lol.project.lol,
                          classifier=lol.classify.nearestCentroid,
                          classifier.return=NaN, k='loo')

# train model and analyze with 5-fold validation using lda classifier
data <- lol.sims.rtrunk(n=200, d=30)  # 200 examples of 30 dimensions
X <- data$X; Y <- data$Y
xval.fit <- lol.xval.optimal_dimselect(X, Y, rs=c(5, 10, 15), lol.project.lol, k=5)

# pass in existing cross-validation sets
sets <- lol.xval.split(X, Y, k=2)
xval.fit <- lol.xval.optimal_dimselect(X, Y, rs=c(5, 10, 15), lol.project.lol, sets=sets)



