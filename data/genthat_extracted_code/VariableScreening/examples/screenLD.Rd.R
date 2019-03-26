library(VariableScreening)


### Name: screenLD
### Title: Perform high-dimensional screening for semiparametric
###   longitudinal regression
### Aliases: screenLD

### ** Examples

set.seed(12345678)
data1 <- simulateLD(p=250,trueIdx = c(5, 100, 200))
Jmin <- min(table(data1$id)) - 1
screenResults <- screenLD(X = data1$X,
                            Y = data1$Y,
                            z = data1$z,
                            id = data1$id,
                            time = data1$time,
                            degree = 3,
                            df = 4,
                            corstr = "stat_M_dep",
                            M = Jmin
                            )
rank <- screenResults$rank
print(which(rank<=10))   # Show the column indexes of the best 10 predictors;
trueIdx <- c(5,100,200)
print(rank[trueIdx])  # Show the ranks given to the four truly active predictors;
# It is found that they all are given high ranks, indicating the function works well.



