library(mclust)


### Name: MclustDA
### Title: MclustDA discriminant analysis
### Aliases: MclustDA print.MclustDA
### Keywords: multivariate

### ** Examples

odd <- seq(from = 1, to = nrow(iris), by = 2)
even <- odd + 1
X.train <- iris[odd,-5]
Class.train <- iris[odd,5]
X.test <- iris[even,-5]
Class.test <- iris[even,5]

# common EEE covariance structure (which is essentially equivalent to linear discriminant analysis)
irisMclustDA <- MclustDA(X.train, Class.train, modelType = "EDDA", modelNames = "EEE")
summary(irisMclustDA, parameters = TRUE)
summary(irisMclustDA, newdata = X.test, newclass = Class.test)

# common covariance structure selected by BIC
irisMclustDA <- MclustDA(X.train, Class.train, modelType = "EDDA")
summary(irisMclustDA, parameters = TRUE)
summary(irisMclustDA, newdata = X.test, newclass = Class.test)

# general covariance structure selected by BIC
irisMclustDA <- MclustDA(X.train, Class.train)
summary(irisMclustDA, parameters = TRUE)
summary(irisMclustDA, newdata = X.test, newclass = Class.test)

plot(irisMclustDA)
plot(irisMclustDA, dimens = 3:4)
plot(irisMclustDA, dimens = 4)

plot(irisMclustDA, what = "classification")
plot(irisMclustDA, what = "classification", newdata = X.test)
plot(irisMclustDA, what = "classification", dimens = 3:4)
plot(irisMclustDA, what = "classification", newdata = X.test, dimens = 3:4)
plot(irisMclustDA, what = "classification", dimens = 4)
plot(irisMclustDA, what = "classification", dimens = 4, newdata = X.test)

plot(irisMclustDA, what = "train&test", newdata = X.test)
plot(irisMclustDA, what = "train&test", newdata = X.test, dimens = 3:4)
plot(irisMclustDA, what = "train&test", newdata = X.test, dimens = 4)

plot(irisMclustDA, what = "error")
plot(irisMclustDA, what = "error", dimens = 3:4)
plot(irisMclustDA, what = "error", dimens = 4)
plot(irisMclustDA, what = "error", newdata = X.test, newclass = Class.test)
plot(irisMclustDA, what = "error", newdata = X.test, newclass = Class.test, dimens = 3:4)
plot(irisMclustDA, what = "error", newdata = X.test, newclass = Class.test, dimens = 4)

## Not run: 
##D # simulated 1D data
##D n <- 250 
##D set.seed(1)
##D triModal <- c(rnorm(n,-5), rnorm(n,0), rnorm(n,5))
##D triClass <- c(rep(1,n), rep(2,n), rep(3,n))
##D odd <- seq(from = 1, to = length(triModal), by = 2)
##D even <- odd + 1
##D triMclustDA <- MclustDA(triModal[odd], triClass[odd])
##D summary(triMclustDA, parameters = TRUE)
##D summary(triMclustDA, newdata = triModal[even], newclass = triClass[even])
##D plot(triMclustDA, what = "scatterplot")
##D plot(triMclustDA, what = "classification")
##D plot(triMclustDA, what = "classification", newdata = triModal[even])
##D plot(triMclustDA, what = "train&test", newdata = triModal[even])
##D plot(triMclustDA, what = "error")
##D plot(triMclustDA, what = "error", newdata = triModal[even], newclass = triClass[even])
##D 
##D # simulated 2D cross data
##D data(cross)
##D odd <- seq(from = 1, to = nrow(cross), by = 2)
##D even <- odd + 1
##D crossMclustDA <- MclustDA(cross[odd,-1], cross[odd,1])
##D summary(crossMclustDA, parameters = TRUE)
##D summary(crossMclustDA, newdata = cross[even,-1], newclass = cross[even,1])
##D plot(crossMclustDA, what = "scatterplot")
##D plot(crossMclustDA, what = "classification")
##D plot(crossMclustDA, what = "classification", newdata = cross[even,-1])
##D plot(crossMclustDA, what = "train&test", newdata = cross[even,-1])
##D plot(crossMclustDA, what = "error")
##D plot(crossMclustDA, what = "error", newdata =cross[even,-1], newclass = cross[even,1])
## End(Not run)



