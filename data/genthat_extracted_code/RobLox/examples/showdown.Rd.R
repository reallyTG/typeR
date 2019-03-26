library(RobLox)


### Name: showdown
### Title: Estimator Showdown by Monte-Carlo Study.
### Aliases: showdown
### Keywords: robust

### ** Examples

library(MASS)
## compare with Huber's Proposal 2
showdown(n = 20, M = 100, eps = 0.02, contD = Norm(mean = 3, sd = 3), 
         estfun = function(x){ unlist(hubers(x)) },
         plot1 = TRUE, plot2 = TRUE, plot3 = TRUE)

## compare with Huber M estimator with MAD scale
showdown(n = 20, M = 100, eps = 0.02, contD = Norm(mean = 3, sd = 3), 
         estfun = function(x){ unlist(huber(x)) },
         plot1 = TRUE, plot2 = TRUE, plot3 = TRUE)



