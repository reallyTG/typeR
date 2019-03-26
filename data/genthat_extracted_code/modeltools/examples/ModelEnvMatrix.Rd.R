library(modeltools)


### Name: ModelEnvMatrix
### Title: Generate a model environment from design and response matrix
### Aliases: ModelEnvMatrix
### Keywords: misc

### ** Examples

### use Sepal measurements as input and Petal as response
data(iris)
me <- ModelEnvMatrix(iris[,1:2], iris[,3:4])
me

### extract data from the ModelEnv object
dim(me@get("designMatrix"))
summary(me@get("responseMatrix"))

### subsets and missing values
iris[1,1] <- NA
me  <- ModelEnvMatrix(iris[,1:2], iris[,3:4], subset=1:5, na.action=na.omit)

## First case is not complete, so me contains only cases 2:5
me
me@get("designMatrix")
me@get("responseMatrix")

## use different cases
me@set(data=iris[10:20,])
me@get("designMatrix")

## these two should be the same
stopifnot(all.equal(me@get("responseMatrix"), as.matrix(iris[10:20,3:4])))



