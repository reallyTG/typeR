library(pMineR)


### Name: secondOrderMarkovModel
### Title: A class to train Second Order Markov Models#'
### Aliases: secondOrderMarkovModel

### ** Examples

## Not run: 
##D 
##D # create a Loader
##D obj.L<-dataLoader();   
##D 
##D # Load a .csv 
##D obj.L$load.csv(nomeFile = "../otherFiles/mammella.csv",
##D IDName = "CODICE_SANITARIO_ADT",
##D EVENTName = "DESC_REPARTO_RICOVERO",
##D dateColumnName = "DATA_RICOVERO")
##D 
##D # get the loaded data
##D dati <- obj.L$getData()
##D 
##D # build a Second Order Marvov Model with a threshold of 0.2
##D SOMM <- secondOrderMarkovModel( 
##D parameters.list = list("threshold"=0.002))
##D 
##D # load the data
##D SOMM$loadDataset(dataList = dati)
##D 
##D # train a model
##D SOMM$trainModel()
##D 
##D # generate 10 new processes (nb: if the 
##D # threshold is too low, it can fail...)
##D aaa <- SOMM$play(numberOfPlays = 10)
##D 
##D # get the transition matrix
##D TranMatrix <- SOMM$getModel(kindOfOutput = "MM.2.Matrix.perc")
##D 
##D 
## End(Not run)



