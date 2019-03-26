library(pMineR)


### Name: firstOrderMarkovModel
### Title: A class to train First Order Markov Models
### Aliases: firstOrderMarkovModel

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
##D FOMM <- firstOrderMarkovModel( 
##D parameters.list = list("threshold"=0.001))
##D 
##D # load the data
##D FOMM$loadDataset(dataList = dati)
##D 
##D # train a model
##D FOMM$trainModel()
##D 
##D # generate 10 new processes (nb: if the 
##D # threshold is too low, it can fail...)
##D aaa <- FOMM$play(numberOfPlays = 10)
##D 
##D # get the transition matrix
##D TranMatrix <- FOMM$getModel(kindOfOutput = "MMatrix.perc")
##D 
##D # plot the model
##D FOMM$plot()
##D 
##D # generate other 20 fake-processes
##D ooo <- FOMM$play(numberOfPlays = 20)
##D 
## End(Not run)



