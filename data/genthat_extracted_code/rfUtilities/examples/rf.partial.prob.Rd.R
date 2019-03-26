library(rfUtilities)


### Name: rf.partial.prob
### Title: Random Forest probability scaled partial dependency plots
### Aliases: rf.partial.prob

### ** Examples

 require(randomForest)
   data(iris)
   iris.rf <- randomForest(iris[,1:4], iris[,5])		
 	 
 # plot all parameters	 
 par(mfrow=c(2,2))
   for(i in names(iris)[1:4]) {     
     rf.partial.prob(iris.rf, iris, i, "setosa", smooth="spline", 
                     n.pt=70, smooth.parm = 0.5)
    }

 # Plot spline and loess smoothing for one parameter, with raw points and line
 par(mfrow=c(1,2))	 
   rf.partial.prob(x = iris.rf, pred.data = iris, xname = "Sepal.Length", 
                   which.class = "setosa", smooth = "spline", smooth.parm = 0.5,
   				  n.pt = 70, pts = TRUE, raw.line = TRUE, rug = TRUE)
   				
   rf.partial.prob(x = iris.rf, pred.data = iris, xname = "Sepal.Length", 
                   which.class = "setosa", smooth = "loess", smooth.parm = 0.20,
   				  n.pt = 70, pts = TRUE, raw.line = TRUE, rug = TRUE)




