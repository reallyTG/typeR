library(Radviz)


### Name: do.radviz
### Title: Projects a Matrix or a Data Frame to a 2D space defined by
###   Dimensional Anchors
### Aliases: do.radviz do.radviz.default

### ** Examples

# the first example generates a simple Radviz object
data(iris)
das <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
S <- make.S(das)
rv <- do.radviz(iris,S)
summary(rv)

# in case a point cannot be projected, a warning will be raise
iris0 <- rbind(iris,c(rep(0,length(das)),NA))
rv0 <- do.radviz(iris0,S)

# to find out how many points could not be projected:
with(rv0,sum(!valid))

# to find which points where invalid in the data
with(rv0,which(!valid))

# to review the original data points
with(rv0,subset(data,!valid))




