library(crossval)


### Name: crossval
### Title: Generic Function for Cross Valdidation
### Aliases: crossval
### Keywords: multivariate

### ** Examples

# load "crossval" package
library("crossval")

# classification examples

# set up lda prediction function
predfun.lda = function(train.x, train.y, test.x, test.y, negative)
{
  require("MASS") # for lda function

  lda.fit = lda(train.x, grouping=train.y)
  ynew = predict(lda.fit, test.x)$class

  # count TP, FP etc.
  out = confusionMatrix(test.y, ynew, negative=negative)

  return( out )
}


# Student's Sleep Data
data(sleep)
X = as.matrix(sleep[,1, drop=FALSE]) # increase in hours of sleep 
Y = sleep[,2] # drug given 
plot(X ~ Y)
levels(Y) # "1" "2"
dim(X) # 20  1

set.seed(12345)
cv.out = crossval(predfun.lda, X, Y, K=5, B=20, negative="1")

cv.out$stat
# FP   TP   TN   FN 
#0.60 1.08 1.40 0.92

diagnosticErrors(cv.out$stat)
#     acc      sens      spec       ppv       npv       lor 
#0.6200000 0.5400000 0.7000000 0.6428571 0.6034483 1.0076405 


## Not run: 
##D 
##D # Wine Data - see http://archive.ics.uci.edu/ml/datasets/Wine for details
##D wine.data = read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data",
##D           sep=",")
##D c = wine.data[,1]
##D X = as.matrix(wine.data[c!=3,-1])
##D Y = as.factor(c[c!=3])
##D dim(X) # 130  13
##D levels(Y) # "1", "2"
##D 
##D set.seed(12345)
##D cv.out = crossval(predfun.lda, X, Y, K=5, B=50, negative="1")
##D 
##D cv.out$stat
##D #   FP     TP     TN     FN 
##D # 0.028 14.092 11.772  0.108
##D 
##D diagnosticErrors(cv.out$stat)
##D #      acc       sens       spec        ppv        npv        lor 
##D # 0.9947692  0.9923944  0.9976271  0.9980170  0.9909091 10.9125059 
## End(Not run)


# linear regression example

data("attitude")
y = attitude[,1] # rating variable
x = attitude[,-1] # date frame with the remaining variables
is.factor(y) # FALSE

summary( lm(y ~ . , data=x) )

# set up lm prediction function
predfun.lm = function(train.x, train.y, test.x, test.y)
{
  lm.fit = lm(train.y ~ . , data=train.x)
  ynew = predict(lm.fit, test.x )

  # compute squared error risk (MSE)
  out = mean( (ynew - test.y)^2 )

  return( out )
}


# prediction MSE using all variables
set.seed(12345)
cv.out = crossval(predfun.lm, x, y, K=5, B=20)
c(cv.out$stat, cv.out$stat.se) # 68.06480  2.91447

# and only two variables
cv.out = crossval(predfun.lm, x[,c(1,3)], y, K=5, B=20)
c(cv.out$stat, cv.out$stat.se) # 52.855325  1.878877



# for more examples (e.g. using cross validation in a regression or classification context)
# see the R packages "sda", "care", or "binda".




