library(EdSurvey)


### Name: summary2
### Title: Summarize edsurvey.data.frame Variables
### Aliases: summary2

### ** Examples

# read in the example data (generated, not real student data)
sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))

# print out summary of weighted statistics of a continuous variable
summary2(sdf, "composite")

## Not run: 
##D # print out summary of weighted statistics of a variable including omitted levels
##D summary2(sdf, "b017451", omittedLevels = FALSE)
##D 
##D # print out summary of unweighted statistics of a variable
##D summary2(sdf, "composite", weightVar = NULL)
## End(Not run)



