library(umx)


### Name: umxSummarySimplex
### Title: Shows a compact, publication-style, summary of a Simplex model.
### Aliases: umxSummarySimplex umxSummary.MxModelSimplex

### ** Examples

## Not run: 
##D # 4 time model
##D # Select Data
##D data(iqdat)
##D mzData <- subset(iqdat, zygosity == "MZ")
##D dzData <- subset(iqdat, zygosity == "DZ")
##D vars = c("IQ_age1", "IQ_age2", "IQ_age3", "IQ_age4")
##D m1= umxSimplex(selDVs= vars, sep= "_T", dzData= dzData, mzData= mzData, tryHard= "mxTryHard")
##D umxSummary(m1, file = NA);
## End(Not run)



