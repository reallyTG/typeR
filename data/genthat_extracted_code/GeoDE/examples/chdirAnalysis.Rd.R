library(GeoDE)


### Name: chdirAnalysis
### Title: A Function to Perform Characteristic Direction Analysis.
### Aliases: chdirAnalysis
### Keywords: differential expression DE genes

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

##################################
#
# An example characteristic direction analysis
#
##################################

# Load the example data

data(example_expression_data)
data(example_sampleclass)
data(example_gammas)

# Examine the expression data
head(example_expression_data)

# Examine the corresponding sample class factor
example_sampleclass

# Run the analysis
chdir_analysis_example <- chdirAnalysis(example_expression_data,example_sampleclass,example_gammas
,CalculateSig=TRUE,nnull=10)

# Examine the results with the first value of the shrinkage parameter (gamma)

# show the first few of the most important genes.

lapply(chdir_analysis_example$results, function(x) x[1:10])

# We can also extract the results of the \code{chdirSig} function
# for example chdir_analysis_example$chdirprops[[1]] gives the whole
# characteristic direction vector for each value of gamma:

lapply(chdir_analysis_example$chdirprops[[1]],head)

# and the estimated number of significant genes can be recovered with

chdir_analysis_example$chdirprops$number_sig_genes


## The function is currently defined as
function (datain, sampleclass, gammas = list(1), nnull = 3, CalculateSig = FALSE) 
{
    if (length(sampleclass) != (length(datain) - 1)) 
        stop("number of elements in sampleclass is inconsistent with input data")
    if (!is.data.frame(datain)) 
        stop("Input data is not in the form of a data frame")
    if (FALSE %in% (c("1", "2") %in% levels(sampleclass))) 
        stop("sample class does not include '1' and '2'")
    if (length(datain[sampleclass == 1]) < 2) 
        stop("too few controll samples")
    if (length(datain[sampleclass == 2]) < 2) 
        stop("too few samples")
    chdirresults <- chdirSig(datain, sampleclass, gammas, nnull = nnull, 
        CalculateSig = CalculateSig)
    chdirplots(chdirresults, sampleclass, gammas, CalculateSig)
    outAll <- lapply(chdirresults[[1]], function(x) {
        x[sort.list(x^2, decreasing = TRUE), ]
    })
    if (CalculateSig) {
        outSig <- mapply(function(x, ns) {
            x[sort.list(x^2, decreasing = TRUE)[1:ns], ]
        }, chdirresults[[1]], chdirresults[[6]])
        list(chdirprops = chdirresults, results = outSig)
    }
    else {
        list(chdirprops = chdirresults, results = outAll)
    }
  }



