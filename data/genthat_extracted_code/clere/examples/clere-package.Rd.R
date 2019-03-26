library(clere)


### Name: clere-package
### Title: CLERE methodology for simultaneous variables clustering and
###   regression
### Aliases: clere clere-package
### Keywords: clere-package Clere clere package

### ** Examples
 
 # Simple example using simulated data
 # to see how to you the main function clere
 # library(clere)
 x     <- matrix(rnorm(50 * 100), nrow = 50, ncol = 100)
 y     <- rnorm(50)
 model <- fitClere(y = y, x = x, g = 2, plotit = FALSE)
 plot(model) 
 clus <- clusters(model, threshold = NULL)
 predict(model, newx = x+1)
 summary(model)



