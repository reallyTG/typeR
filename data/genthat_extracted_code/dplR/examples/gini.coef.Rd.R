library(dplR)


### Name: gini.coef
### Title: Calculate the Gini Coefficient
### Aliases: gini.coef
### Keywords: univar

### ** Examples
docFile <- system.file("doc", "math-dplR.pdf", package="dplR")
cat("See the following PDF for mathematical details:\n")
cat(docFile, sep="\n")
## Not run: 
##D if (interactive() && requireNamespace("Biobase")) {
##D     Biobase::openPDF(docFile)
##D }
## End(Not run)
library(utils)
data(ca533)
ca533.rwi <- detrend(rwl = ca533, method = "ModNegExp")
ca533.crn <- chron(ca533.rwi, prefix = "CAM")
gini.coef(ca533.crn)



