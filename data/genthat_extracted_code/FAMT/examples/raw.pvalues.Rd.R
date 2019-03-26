library(FAMT)


### Name: raw.pvalues
### Title: Calculation of classical multiple testing statistics and
###   p-values
### Aliases: raw.pvalues

### ** Examples

data(expression)
data(covariates)
data(annotations)

# Create the 'FAMTdata'
############################################
chicken = as.FAMTdata(expression,covariates,annotations,idcovar=2)
# 'FAMTdata' summary
summaryFAMT(chicken)

# Calculation of classical p-values
############################################
# test on the 6th covariate: 
rawpval = raw.pvalues(chicken,x=6)
hist(rawpval$pval)

# with a supplementary covariate (third column of the covariates data frame)
## Not run: rawpval = raw.pvalues(chicken,x=c(3,6),test=6)
## Not run: hist(rawpval$pval)



