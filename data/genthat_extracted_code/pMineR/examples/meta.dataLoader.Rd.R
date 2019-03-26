library(pMineR)


### Name: meta.dataLoader
### Title: Load the event-logs serializing many dataLoaders objs
### Aliases: meta.dataLoader

### ** Examples

## Not run: 
##D 
##D # create a Loader
##D obj.L<-meta.dataLoader();   
##D 
##D # create a view
##D obj.L$createView(view.name = "mammella")
##D obj.L$createView(view.name = "retto")
##D 
##D # Load a .csv into the view 'mammella'
##D obj.L$load.csv(nomeFile = "../otherFiles/mammella.csv",
##D IDName = "CODICE_SANITARIO_ADT",
##D EVENTName = "DESC_REPARTO_RICOVERO",
##D dateColumnName = "DATA_RICOVERO", view="mammella")
##D 
##D # Load a .csv into the view 'retto'
##D obj.L$load.csv(nomeFile = "../otherFiles/mammella.csv",
##D IDName = "CODICE_SANITARIO_ADT",
##D EVENTName = "DESC_REPARTO_RICOVERO",
##D dateColumnName = "DATA_RICOVERO", view="retto")
##D 
##D # get the data from the view 'retto'
##D aaa <- obj.L$getData(view = "retto")
##D 
##D 
## End(Not run)



