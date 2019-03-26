library(GeoDE)


### Name: GeoDE-package
### Title: Differential Expression and Enrichment Analysis with
###   (Geo)metrical(D)ifferential(E)expression.
### Aliases: GeoDE-package GeoDE
### Keywords: package gene differential expression enrichmnet multivariate
###   characteristic direction

### ** Examples


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
chdir_analysis_example <- chdirAnalysis(example_expression_data,example_sampleclass,example_gammas
,CalculateSig=FALSE)

# Run the PAEA analysis

PAEAtest <- PAEAAnalysis(chdir_analysis_example$chdirprops, gmt[1:100], example_gammas)

# Examine the p values

PAEAtest$p_values

# Examine the principal angles

PAEAtest$principal_angles

##################################
#
# An example multigmtPAEA analysis
#
##################################
# Load the expression data

data(example_expression_data)
data(example_sampleclass)
data(example_gammas)

#load GMT file names
data(AllGMTfiles)

# Run the characteristic direction analysis
chdir_analysis_example <- chdirAnalysis(example_expression_data,example_sampleclass,example_gammas
,CalculateSig=FALSE)

# Run the PAEA analysis over the first two GMT files in the library

multiPAEAtest <- multigmtPAEAAnalysis(chdir_analysis_example$chdirprops, AllGMTfiles[2:3],
example_gammas)

# To run on all the gmt files

#multiPAEAtestAll <- multigmtPAEAAnalysis(chdir_analysis_example$chdirprops, gammas=example_gammas)






