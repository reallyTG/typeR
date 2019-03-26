library(yaImpute)


### Name: ensembleImpute
### Title: Computes the mean, median, or mode among a list of impute.yai
###   objects
### Aliases: ensembleImpute
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

reps <- replicate(10, yai(x=x,y=y,method="msn",bootstrap=TRUE,k=2),
                  simplify=FALSE)

ensembleImpute(reps,ancillaryData=iris)




