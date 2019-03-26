library(RESS)


### Name: read.essentia
### Title: read.essentia
### Aliases: read.essentia

### ** Examples

## Not run: 
##D --------------------------------------------------------------------------------------------------
##D 
##D These examples require Essentia to be installed:
##D 
##D queryfile <- file("examplequery.sh","w")
##D cat("ess exec \"echo -e '11,12,13\n4,5,6\n7,8,9'\" \n", file=queryfile)
##D simpleecho <- read.essentia("examplequery.sh")
##D print(simpleecho)
##D 
##D --------------------------------------------------------------------------------------------------
##D 
##D This example requires Essentia to have selected a datastore containing purchase log data:
##D 
##D Store these lines as querypurchase.sh:
##D 
##D ess query "select count(refID) from purchase:2014-09-01:2014-09-15 \
##D where articleID>=46 group by userID"
##D 
##D -----------------------------------------------
##D 
##D Then run these commands in R:
##D 
##D library(RESS)
##D print(read.essentia("querypurchase.sh"))
##D 
##D 
##D --------------------------------------------------------------------------------------------------
##D 
##D The following example requires Essentia to be installed with apache log data stored in it.
##D 
##D Store the following lines as queryapache.sh:
##D 
##D # Query the Essentia database logsapache1 and save the sorted contents of vector1 in R as command2.
##D ess exec "aq_udb -exp logsapache1:vector1 -sort pagecount -dec"
##D 
##D 
##D -----------------------------------------------
##D 
##D Then run these commands in R:
##D 
##D library(RESS)
##D mydata <- read.essentia("queryapache.sh")
##D 
##D print(mydata)
##D 
##D 
##D The references contain more extensive examples that
##D fully walkthrough how to load and query the Essentia Database.
##D 
## End(Not run)



