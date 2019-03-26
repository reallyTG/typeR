library(IPMRF)


### Name: ipmrangernew
### Title: IPM casewise with RF by 'ranger' for new cases, whose responses
###   do not need to be known
### Aliases: ipmrangernew
### Keywords: tree multivariate

### ** Examples


## Not run: 
##D library(ranger)
##D num.trees=500
##D rf <- ranger(Species ~ ., data = iris,keep.inbag = TRUE,num.trees=num.trees)
##D 
##D IPM_complete=apply(ipmrangernew(rf,iris[,-5],num.trees),FUN=mean,2)
## End(Not run)



