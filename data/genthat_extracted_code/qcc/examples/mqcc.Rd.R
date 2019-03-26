library(qcc)


### Name: mqcc
### Title: Multivariate Quality Control Charts
### Aliases: mqcc print.mqcc summary.mqcc plot.mqcc
### Keywords: htest hplot multivariate

### ** Examples

##
##  Subgrouped data
##

# Ryan (2000, Table 9.2) data with p = 2 variables, m = 20 samples, n = 4 sample size:
X1 <- matrix(c(72, 56, 55, 44, 97, 83, 47, 88, 57, 26, 46, 
49, 71, 71, 67, 55, 49, 72, 61, 35, 84, 87, 73, 80, 26, 89, 66, 
50, 47, 39, 27, 62, 63, 58, 69, 63, 51, 80, 74, 38, 79, 33, 22, 
54, 48, 91, 53, 84, 41, 52, 63, 78, 82, 69, 70, 72, 55, 61, 62, 
41, 49, 42, 60, 74, 58, 62, 58, 69, 46, 48, 34, 87, 55, 70, 94, 
49, 76, 59, 57, 46), ncol = 4)
X2 <- matrix(c(23, 14, 13, 9, 36, 30, 12, 31, 14, 7, 10, 
11, 22, 21, 18, 15, 13, 22, 19, 10, 30, 31, 22, 28, 10, 35, 18, 
11, 10, 11, 8, 20, 16, 19, 19, 16, 14, 28, 20, 11, 28, 8, 6, 
15, 14, 36, 14, 30, 8, 35, 19, 27, 31, 17, 18, 20, 16, 18, 16, 
13, 10, 9, 16, 25, 15, 18, 16, 19, 10, 30, 9, 31, 15, 20, 35, 
12, 26, 17, 14, 16), ncol = 4)
X <- list(X1 = X1, X2 = X2)

q <- mqcc(X, type = "T2")
summary(q)
ellipseChart(q)
ellipseChart(q, show.id = TRUE)

q <- mqcc(X, type = "T2", pred.limits = TRUE)

# Ryan (2000) discussed Xbar-charts for single variables computed adjusting the 
# confidence level of the T^2 chart:
q1 <- qcc(X1, type = "xbar", confidence.level = q$confidence.level^(1/2))
summary(q1)
q2 <- qcc(X2, type = "xbar", confidence.level = q$confidence.level^(1/2))
summary(q2)


require(MASS)
# generate new "in control" data
Xnew <- list(X1 = matrix(NA, 10, 4), X2 =  matrix(NA, 10, 4))
for(i in 1:4)
   { x <- mvrnorm(10, mu = q$center, Sigma = q$cov)
     Xnew$X1[,i] <- x[,1]
     Xnew$X2[,i] <- x[,2] 
   }
qq <- mqcc(X, type = "T2", newdata = Xnew, pred.limits = TRUE)
summary(qq)

# generate new "out of control" data
Xnew <- list(X1 = matrix(NA, 10, 4), X2 =  matrix(NA, 10, 4))
for(i in 1:4)
   { x <- mvrnorm(10, mu = 1.2*q$center, Sigma = q$cov)
     Xnew$X1[,i] <- x[,1]
     Xnew$X2[,i] <- x[,2] 
   }
qq <- mqcc(X, type = "T2", newdata = Xnew, pred.limits = TRUE)
summary(qq)

##
## Individual observations data
##

data(boiler)

q <- mqcc(boiler, type = "T2.single", confidence.level = 0.999)
summary(q)

# generate new "in control" data
boilerNew <- mvrnorm(10, mu = q$center, Sigma = q$cov)
qq <- mqcc(boiler, type = "T2.single", confidence.level = 0.999, 
           newdata = boilerNew, pred.limits = TRUE)
summary(qq)

# generate new "out of control" data
boilerNew = mvrnorm(10, mu = 1.01*q$center, Sigma = q$cov)
qq <- mqcc(boiler, type = "T2.single", confidence.level = 0.999, 
           newdata = boilerNew, pred.limits = TRUE)
summary(qq)

# provides "robust" estimates of means and covariance matrix
library(MASS)
rob <- cov.rob(boiler)
qrob <- mqcc(boiler, type = "T2.single", center = rob$center, cov = rob$cov)
summary(qrob)




