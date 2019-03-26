library(gains)


### Name: plot.gains
### Title: Plotting Gains Table Objects
### Aliases: plot.gains
### Keywords: misc

### ** Examples

data(ciaScores)
## Not run: 
##D plot(with(subset(ciaScores,train==0), 
##D       gains(actual=CellPhonesPP, predicted=PredOLS, optimal=TRUE)),
##D       main="Test Gains Table Plot")
## End(Not run)



