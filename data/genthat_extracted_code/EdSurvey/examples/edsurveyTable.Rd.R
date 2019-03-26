library(EdSurvey)


### Name: edsurveyTable
### Title: EdSurvey Tables With Conditional Means
### Aliases: edsurveyTable

### ** Examples

## Not run: 
##D # read in the example data (generated, not real student data)
##D 
##D sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))
##D 
##D # create a table that shows only the breakdown of dsex
##D edsurveyTable(composite ~ dsex, data=sdf, returnMeans=FALSE, returnSepct=FALSE)
##D 
##D # create a table with composite scores by dsex
##D edsurveyTable(composite ~ dsex, data=sdf)
##D 
##D # add a second variable
##D edsurveyTable(composite ~ dsex + b017451, data=sdf)
##D 
##D # add a second variable, do not omit any levels
##D edsurveyTable(composite ~ dsex + b017451 + b003501, data=sdf, omittedLevels=FALSE)
##D 
##D # add a second variable, do not omit any levels, change aggregation level
##D edsurveyTable(composite ~ dsex + b017451 + b003501, data=sdf, omittedLevels=FALSE,
##D 	            pctAggregationLevel=0)
##D 
##D edsurveyTable(composite ~ dsex + b017451 + b003501, data=sdf, omittedLevels=FALSE,
##D 	            pctAggregationLevel=1)
##D 
##D edsurveyTable(composite ~ dsex + b017451 + b003501, data=sdf, omittedLevels=FALSE,
##D 	            pctAggregationLevel=2)
##D 
##D # variance estimation using the Taylor series 
##D edsurveyTable(composite ~ dsex + b017451 + b003501, data=sdf, varMethod="Taylor")
## End(Not run)



