library(FAMT)


### Name: as.FAMTdata
### Title: Create a 'FAMTdata' object from an expression, covariates and
###   annotations dataset
### Aliases: as.FAMTdata

### ** Examples

# The data are divided into one mandatory data-frame, the gene expressions, 
#  and two optional datasets: the covariates, and the annotations.

# The expression dataset with 9893 rows (genes) and 43 columns (arrays)
#  containing the observations of the responses.
# The covariates dataset with 43 rows (arrays) and 6 columns: 
#  the second column gives the specification to match 'expression' 
#  and 'covariates' (array identification), the other ones contain
#  the observations of covariates.
# The annotations dataset contains 9893 rows (genes) and 
#  6 columns to help interpreting the factors, the first one (ID) 
#  identifies the variables (genes). 

data(expression)
data(covariates)
data(annotations)

# Create the 'FAMTdata'
############################################
chicken = as.FAMTdata(expression,covariates,annotations,idcovar=2)
# 'FAMTdata' summary
summaryFAMT(chicken)




