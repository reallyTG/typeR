library(pMineR)


### Name: dataLoader
### Title: Load the event-logs
### Aliases: dataLoader

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
##D # return the results
##D obj.L$getData()
##D 
## End(Not run)



