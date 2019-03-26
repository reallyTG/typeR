library(difNLR)


### Name: genNLR
### Title: Generates data set based on Non-Linear Regression DIF a DDF
###   models.
### Aliases: genNLR

### ** Examples

## Not run: 
##D # seed
##D set.seed(123)
##D # generating parameters for dichotomous data with DIF, 5 items
##D a <- matrix(runif(10, 0.8, 2), ncol = 2)
##D b <- matrix(runif(10, -2, 2), ncol = 2)
##D c <- matrix(runif(10, 0, 0.25), ncol = 2)
##D d <- matrix(runif(10, 0.8, 1), ncol = 2)
##D # generating dichotomous data set with 300 observations (150 each group)
##D genNLR(N = 300, a = a, b = b, c = c, d = d)
##D # generating dichotomous data set with 300 observations (150 each group)
##D # and different mean and standard deviation for underlying distribution
##D genNLR(N = 300, a = a, b = b, c = c, d = d, mu = c(1, 0), sigma = c(1, 2))
##D # generating dichotomous data set with 300 observations (250 reference group, 50 focal)
##D genNLR(N = 300, ratio = 5, a = a, b = b, c = c, d = d)
##D 
##D # generating parameters for nominal data with DDF, 5 items,
##D # each item 3 choices
##D a <- matrix(runif(20, 0.8, 2), ncol = 4)
##D b <- matrix(runif(20, -2, 2), ncol = 4)
##D # generating nominal data set with 300 observations (150 each group)
##D genNLR(N = 300, itemtype = "nominal", a = a, b = b)
##D # generating nominal data set with 300 observations (250 reference group, 50 focal)
##D genNLR(N = 300, itemtype = "nominal", ratio = 5, a = a, b = b)
##D 
##D # generating parameters for nominal data with DDF, 5 items,
##D # items 1 and 2 have 2 choices, items 3, 4 and 5 have 3 choices
##D a <- matrix(runif(20, 0.8, 2), ncol = 4)
##D a[1:2, c(2, 4)] <- NA
##D b <- matrix(runif(20, -2, 2), ncol = 4)
##D b[1:2, c(2, 4)] <- NA
##D # generating nominal data set with 300 observations (150 each group)
##D genNLR(N = 300, itemtype = "nominal", a = a, b = b)
##D # generating nominal data set with 300 observations (250 reference group, 50 focal)
##D genNLR(N = 300, itemtype = "nominal", ratio = 5, a = a, b = b)
##D 
## End(Not run)



