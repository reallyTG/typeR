library(arules)


### Name: discretize
### Title: Convert a Continuous Variable into a Categorical Variable
### Aliases: discretize binning discretizeDF
### Keywords: manip

### ** Examples

data(iris)
x <- iris[,1]

### look at the distribution before discretizing
hist(x, breaks = 20, main = "Data")

def.par <- par(no.readonly = TRUE) # save default
layout(mat = rbind(1:2,3:4))

### convert continuous variables into categories (there are 3 types of flowers)
### the default method is equal frequency
table(discretize(x, breaks = 3))
hist(x, breaks = 20, main = "Equal Frequency")
abline(v = discretize(x, breaks = 3, 
  onlycuts = TRUE), col = "red")
# Note: the frequencies are not exactly equal because of ties in the data 

### equal interval width
table(discretize(x, method = "interval", breaks = 3))
hist(x, breaks = 20, main = "Equal Interval length")
abline(v = discretize(x, method = "interval", breaks = 3, 
  onlycuts = TRUE), col = "red")

### k-means clustering 
table(discretize(x, method = "cluster", breaks = 3))
hist(x, breaks = 20, main = "K-Means")
abline(v = discretize(x, method = "cluster", breaks = 3, 
  onlycuts = TRUE), col = "red")

### user-specified (with labels)
table(discretize(x, method = "fixed", breaks = c(-Inf, 6, Inf), 
    labels = c("small", "large")))
hist(x, breaks = 20, main = "Fixed")
abline(v = discretize(x, method = "fixed", breaks = c(-Inf, 6, Inf), 
    onlycuts = TRUE), col = "red")

par(def.par)  # reset to default

### prepare the iris data set for association rule mining
### use default discretization
irisDisc <- discretizeDF(iris)
head(irisDisc)

### discretize all numeric columns differently
irisDisc <- discretizeDF(iris, default = list(method = "interval", breaks = 2, 
  labels = c("small", "large")))
head(irisDisc)

### specify discretization for the petal columns and don't discretize the others
irisDisc <- discretizeDF(iris, methods = list(
  Petal.Length = list(method = "frequency", breaks = 3, 
    labels = c("short", "medium", "long")),
  Petal.Width = list(method = "frequency", breaks = 2, 
    labels = c("narrow", "wide"))
  ),
  default = list(method = "none")
  )
head(irisDisc)

### discretize new data using the same discretization scheme as the
###   data.frame supplied in methods. Note: NAs may occure if a new 
###   value falls outside the range of values observed in the 
###   originally discretized table (use argument infinity = TRUE in 
###   discretize to prevent this case.) 
discretizeDF(iris[sample(1:nrow(iris), 5),], methods = irisDisc)



