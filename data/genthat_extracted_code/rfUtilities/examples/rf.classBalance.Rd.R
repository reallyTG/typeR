library(rfUtilities)


### Name: rf.classBalance
### Title: Random Forest Class Balance (Zero Inflation Correction) Model
### Aliases: rf.classBalance

### ** Examples

require(randomForest)
data(iris)
  iris$Species <- as.character(iris$Species)
    iris$Species <- ifelse(iris$Species == "setosa", "virginica", iris$Species)
      iris$Species <- as.factor(iris$Species)	
	
# Percent of "virginica" observations
length( iris$Species[iris$Species == "virginica"] ) / dim(iris)[1]*100

# Balanced model	
( cb <- rf.classBalance( ydata=iris[,"Species"], xdata=iris[,1:4], cbf=1 ) )

# Calculate Kappa for each balanced model in ensemble 
for(i in 1:length(cb$confusion) ) { 
  print( accuracy(cb$confusion[[i]][,1:2])[5] ) 
}

# Evaluate cumulative and mean confusion matrix
accuracy( round((cb$confusion[[1]] + cb$confusion[[2]] + cb$confusion[[3]]))[,1:2] )
accuracy( round((cb$confusion[[1]] + cb$confusion[[2]] + cb$confusion[[3]])/3)[,1:2])




