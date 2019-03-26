library(pMineR)


### Name: cluster_expectationMaximization
### Title: A class to perform Expectation-Maximization clustering on
###   sequential data for Process Mining issues
### Aliases: cluster_expectationMaximization

### ** Examples

## Not run: 
##D 
##D # create a Loader
##D obj.L<-dataLoader();   # create a Loader
##D 
##D # Load a .csv using "DES" and "ID" as column names to indicate events
##D # and Patient's ID
##D obj.L$load.csv(nomeFile = "./otherFiles/test_02.csv",
##D IDName = "ID",EVENTName = "DES", dateColumnName = "DATA")
##D 
##D # now create an object cluster_expectationMaximization
##D obj.clEM<- cluster_expectationMaximization();
##D 
##D # load the data into logInspector object
##D obj.clEM$loadDataset( obj.L$getData() );
##D 
##D # perform clustering computation
##D obj.clEM$calculateClusters(num = 5, typeOfModel = "firstOrderMarkovModel");
##D 
##D # get calculated clusters 
##D a <- obj.clEM$getClusters();
##D 
##D # get informations about performance of clusters
##D b <- obj.clEM$getClusterStats();
##D 
##D # get log of each iteration of the algorithm
##D d <- obj.clEM$getClusterLog();
## End(Not run)



