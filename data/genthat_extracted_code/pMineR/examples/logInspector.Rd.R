library(pMineR)


### Name: logInspector
### Title: A class to perform a preliminary analysis on sequential data for
###   Process Mining issues
### Aliases: logInspector

### ** Examples

## Not run: 
##D # -----------------------------------------------
##D #  USING THE METHODS of the class
##D # -----------------------------------------------
##D obj.L<-dataLoader();   # create a Loader
##D 
##D # Load a .csv using "DES" and "ID" as column names to indicate events
##D # and Patient's ID
##D obj.L$load.csv(nomeFile = "../otherFiles/test_02.csv",
##D IDName = "ID",EVENTName = "DES",dateColumnName = "DATA")
##D 
##D # now create an object logInspector
##D obj.logI<-logInspector();
##D 
##D # load the data into logInspector object
##D obj.logI$loadDataset( obj.L$getData() );
##D 
##D # get event-related descriptive statistics
##D obj.logI$getEventStats();
##D 
##D # get process-related descriptive statistics
##D obj.logI$getProcessStats();
##D 
##D # plot event-related descriptive statistics
##D obj.logI$plotEventStats();
##D 
##D # plot process-related descriptive statistics
##D obj.logI$plotProcessStats()
## End(Not run)



