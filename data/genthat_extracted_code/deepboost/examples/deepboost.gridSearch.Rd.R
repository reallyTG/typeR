library(deepboost)


### Name: deepboost.gridSearch
### Title: Returns optimised parameter list for deepboost model on given
###   data
### Aliases: deepboost.gridSearch

### ** Examples

deepboost.gridSearch(y ~ .,
 data.frame(x1=rep(c(0,0,1,1),2),x2=rep(c(0,1,0,1),2),y=factor(rep(c(0,0,0,1),2))), k=2)



