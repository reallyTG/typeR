library(yaImpute)


### Name: newtargets
### Title: Finds K nearest neighbors for new target observations
### Aliases: newtargets
### Keywords: multivariate

### ** Examples


require (yaImpute)

data(iris)

# set the random number seed so that example results are consistant
# normally, leave out this command
set.seed(12345)

# form some test data
refs=sample(rownames(iris),50) # just the reference observations
x <- iris[refs,1:3]  # Sepal.Length Sepal.Width Petal.Length
y <- iris[refs,4:5]  # Petal.Width Species

# build a yai object using mahalanobis
mal <- yai(x=x,y=y,method="mahalanobis")

# get imputations for the target observations (not references)
malNew <- newtargets(mal,iris[!(rownames(iris) %in% rownames(x)),])

# output a data frame of observed and imputed values for
# the observations that are not in the original yai object

impute(malNew,vars=yvars(malNew))

# in this example, Y is not specified (not required for mahalanobis).
mal2 <- yai(x=x,method="mahalanobis")
identical(foruse(mal),foruse(mal2))

if (require(randomForest))
{
  # here, method randomForest's unsupervised classification is used (no Y).
  rf <- yai(x=x,method="randomForest")
  # now get imputations for the targets in the iris data (those that are
  # not references).
  rfNew <- newtargets(rf,iris[!(rownames(iris) %in% rownames(x)),])
}




