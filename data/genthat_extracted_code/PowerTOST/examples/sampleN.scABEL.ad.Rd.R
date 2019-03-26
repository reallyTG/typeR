library(PowerTOST)


### Name: sampleN.scABEL.ad
### Title: Sample size estimation for ABEL and iteratively adjusted alpha
### Aliases: sampleN.scABEL.ad

### ** Examples

# --- Not run due to timing policy of CRAN for examples
# each may run some ten seconds or more
# using all the defaults:
# TRR|RTR|RRT, target power 80%, assumed ratio 0.90, 1E+6 simulated studies,
# EMA regulatory settings (ABE limits, PE constraint 0.8 - 1.25)
## Not run: 
##D sampleN.scABEL.ad(CV = 0.3)
## End(Not run)
# should result in n 60, power 0.8022.
# Note: Without adjustment by sampleN.scABEL(): n 54, power 0.8159
# Easier to show the details:
## Not run: 
##D sampleN.scABEL.ad(CV = 0.3, details = TRUE)
## End(Not run)
#
# TRTR|RTRT, target power 90%, pre-specified alpha 0.025
## Not run: 
##D sampleN.scABEL.ad(CV = 0.3, targetpower = 0.9, design = "2x2x4", alpha.pre = 0.025)
## End(Not run)
# should result in n 60, power 0.9021; pre-specified alpha justified.



