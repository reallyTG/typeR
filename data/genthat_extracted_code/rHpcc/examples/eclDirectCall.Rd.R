library(rHpcc)


### Name: eclDirectCall
### Title: Executes the ECL code on the cluster specified and returns the
###   XML response
### Aliases: eclDirectCall

### ** Examples

  ## Not run: 
##D     eclCode <- "recCountyFipsCode := RECORD
##D         String CountyNames;
##D         UNSIGNED3 CountyFipsCode;
##D         UNSIGNED2 StateFipsCode;
##D       END;
##D   
##D       dsCountyFips := DATASET('~seer::countyfipscode', recCountyFipsCode, CSV);
##D       OUTPUT(COUNT(dsCountyFips));"
##D       
##D       eclDirectCall(hostName="127.0.0.1", eclCode=eclCode)
##D   
## End(Not run)



