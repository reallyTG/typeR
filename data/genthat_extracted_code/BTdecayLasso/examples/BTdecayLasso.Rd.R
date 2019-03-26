library(BTdecayLasso)


### Name: BTdecayLasso
### Title: Bradley-Terry Model with Exponential Decayed weighted likelihood
###   and Adaptive Lasso
### Aliases: BTdecayLasso

### ** Examples

##Initializing Dataframe
x <- BTdataframe(NFL2010)

##The following code runs the main results
##Usually a single lambda's run will take 1-20 s
##The whole Adaptive Lasso run will take 5-20 min
## No test: 
##BTdecayLasso run with exponential decay rate 0.005 and 
##lambda 0.1 on whole lasso path using adaptive lasso
y1 <- BTdecayLasso(x$dataframe, x$ability, lambda = 0.1, 
                   decay.rate = 0.005, fixed = x$worstTeam)
summary(y1)

##Defining equal weight
##Note that comparing to Adaptive weight, the user defined weight may not be 
##efficient in groupiing. Therefore, to run the whole Lasso path 
##(evolving of distinct ability scores), it may take a much longer time. 
##We recommend the user to apply the default setting,
##where Adaptive Lasso will be run.
n <- nrow(x$ability) - 1
w2 <- matrix(1, nrow = n, ncol = n)
w2[lower.tri(w2, diag = TRUE)] <- 0

##BTdecayLasso run with exponential decay rate 0.005 and with a specific lambda 0.1
y2 <- BTdecayLasso(x$dataframe, x$ability, lambda = 0.1, weight = w2, 
                   path = FALSE, decay.rate = 0.005, fixed = x$worstTeam)

##BTdecayLasso run with exponential decay rate 0.005 and with a specific lambda 0.1
##Time-consuming
y3 <- BTdecayLasso(x$dataframe, x$ability, lambda = 0.1, weight = w2, 
                   path = TRUE, decay.rate = 0.005, fixed = x$worstTeam)
summary(y2)

##Plot the Lasso path (S3 method)
plot(y1)
plot(y3)
## End(No test)




