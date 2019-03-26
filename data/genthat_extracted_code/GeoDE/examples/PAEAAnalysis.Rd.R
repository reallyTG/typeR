library(GeoDE)


### Name: PAEAAnalysis
### Title: A Function to Evaluate Gene-Set Enrichment Using PAEA.
### Aliases: PAEAAnalysis
### Keywords: enrichment multivariate

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.


##################################
#
# An example PAEA analysis
#
##################################
# Load the expression data

data(example_expression_data)
data(example_sampleclass)
data(example_gammas)

#load a gmt file
data(GeneOntology_BP.gmt)

# Run the characteristic direction analysis
chdir_analysis_example <- chdirAnalysis(example_expression_data,example_sampleclass,
example_gammas,CalculateSig=FALSE)

# Run the PAEA analysis

PAEAtest <- PAEAAnalysis(chdir_analysis_example$chdirprops, gmt[1:100], example_gammas)

# Examine the p values

PAEAtest$p_values

# Examine the principal angles

PAEAtest$principal_angles


## The function is currently defined as
function (chdirresults, gmtfile, gammas = c(1), casesensitive = FALSE) 
{
    gmtlinenames <- lapply(gmtfile, function(x) x[[1]])
    gmtlines <- lapply(gmtfile, function(x) x[-1])
    PAEAresults <- lapply(gmtlines, function(x) PAEA(chdirresults[[1]], 
        x, casesensitive = casesensitive))
    gammalabels <- unlist(lapply(gammas, function(x) paste("gamma=", 
        x)))
    pvalues <- lapply(PAEAresults, function(x) x[[2]])
    pvalues <- matrix(unlist(pvalues), ncol = length(gmtlines), 
        dimnames = list(gammalabels, gmtlinenames))
    pavalues <- lapply(PAEAresults, function(x) x[[1]])
    pavalues <- matrix(unlist(pvalues), ncol = length(gmtlines), 
        dimnames = list(gammalabels, gmtlinenames))
    gmtp <- sort.list(pvalues[1, ])
    list(t(pvalues[, gmtp]), t(pavalues[, gmtp]))
  }



