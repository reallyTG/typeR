library(nodeHarvest)


### Name: nodeHarvest
### Title: Node Harvest
### Aliases: nodeHarvest

### ** Examples


## Load Boston Housing dataset
    data(BostonHousing)
    X <- BostonHousing[,1:13]
    Y <- BostonHousing[,14]

## Divide data into training and test data
    n <- nrow(X)
    training <- sample(1:n,round(n/2))
    testing <- (1:n)[-training]

    
## Train Node Harvest and plot and print the estimator
    NH <- nodeHarvest( X[training,], Y[training], nodes=500 )
    plot(NH)
    print(NH, nonodes=6)	
    
## Predict on test data and explain prediction of the first sample in the test set
    predicttest <- predict(NH, X[testing,], explain=1)
    plot( predicttest, Y[testing] )




