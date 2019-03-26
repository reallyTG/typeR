library(pifpaf)


### Name: pif.combine
### Title: Combine point estimates of PIF from different subpopulations
### Aliases: pif.combine

### ** Examples


#Example 1
#-------------

#Estimate PAF for each subpopulation
pafmen   <- paf(X = data.frame(2.7), thetahat = 0.12, rr = function(X, theta){X*theta + 1},
                Xvar = 0.11, method = "approximate")
pafwomen <- paf(X = data.frame(3.1), thetahat = 0.12, rr = function(X, theta){exp(X*theta/3)},
                Xvar = 0.17, method = "approximate")

#Estimate PIF for each subpopulation
pifmen   <- pif(X = data.frame(2.7), thetahat = 0.12, rr = function(X, theta){X*theta + 1}, 
                cft = function(X){X/2}, Xvar = 0.11, method = "approximate")
pifwomen <- pif(X = data.frame(3.1), thetahat = 0.12, rr = function(X, theta){exp(X*theta/3)},
                cft = function(X){X/2}, Xvar = 0.17, method = "approximate")

#Combine estimates
pif.combine(c(pifmen, pifwomen), c(pafmen, pafwomen), c(0.45, 0.55))  





