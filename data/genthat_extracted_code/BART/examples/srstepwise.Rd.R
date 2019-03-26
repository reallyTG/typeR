library(BART)


### Name: srstepwise
### Title: Stepwise Variable Selection Procedure for survreg
### Aliases: srstepwise

### ** Examples


names. <- names(lung)[-(2:3)]
status1 <- ifelse(lung$status==2,1,0)
X <- as.matrix(lung)[ , names.]
vars=srstepwise(X, lung$time, status1)
print(names.[vars])




