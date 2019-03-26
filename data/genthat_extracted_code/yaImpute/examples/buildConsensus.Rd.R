library(yaImpute)


### Name: buildConsensus
### Title: Finds the consensus imputations among a list of yai objects
### Aliases: buildConsensus
### Keywords: multivariate

### ** Examples


require (yaImpute)
data(iris)

set.seed(123) 

# form some test data, y's are defined only for reference
# observations.
refs=sample(rownames(iris),50)
x <- iris[,1:2]      # Sepal.Length Sepal.Width
y <- iris[refs,3:4]  # Petal.Length Petal.Width

reps <- replicate(20, yai(x=x,y=y,method="msn",bootstrap=TRUE,k=2),
                  simplify=FALSE)

buildConsensus(reps)




