library(ahaz)


### Name: tune.ahazpen
### Title: Choice of penalty parameter in ahazpen
### Aliases: tune.ahazpen
### Keywords: methods survival

### ** Examples

data(sorlie)

# Break ties
set.seed(10101)
time <- sorlie$time+runif(nrow(sorlie))*1e-2

# Survival data + covariates
surv <- Surv(time,sorlie$status)
X <- as.matrix(sorlie[,3:ncol(sorlie)])

# Training/test data
set.seed(20202)
train <- sample(1:nrow(sorlie),76)
test <- setdiff(1:nrow(sorlie),train)

# Run cross validation on training data
set.seed(10101)
cv.las <- tune.ahazpen(surv[train,], X[train,],dfmax=30)
plot(cv.las)

# Check fit on the test data
testrisk <- predict(cv.las,X[test,],type="lp")
plot(survfit(surv[test,]~I(testrisk<median(testrisk))),main="Low versus high risk")

# Advanced example, cross-validation of one-step SCAD
# with initial solution derived from univariate models.
# Since init.sol is specified as a function, it is
# automatically cross-validated as well
scadfun<-function(surv,X,weights){coef(ahaz(surv,X,univariate=TRUE))}
set.seed(10101)
cv.ssc<-tune.ahazpen(surv[train,],X[train,],
                     penalty=sscad.control(init.sol=scadfun),
                     tune=cv.control(rep=5),dfmax=30)
# Check fit on test data
testrisk <- predict(cv.ssc,X[test,],type="lp")
plot(survfit(surv[test,]~I(testrisk<median(testrisk))),main="Low versus high risk")



