library(PowerTOST)


### Name: scABEL.ad
### Title: Iteratively adjusted alpha for ABEL
### Aliases: scABEL.ad

### ** Examples

# Using all defaults:
# TRR|RTR|RRT, target power 80% for assumed ratio 0.90 (estimated sample size 54),
# EMA regulatory settings (ABE limits and PE constraint 0.80 - 1.25),
# 1E+6 simulated studies.
# Not run: due to timing policy of CRAN for examples
## Not run: 
##D scABEL.ad(CV = 0.3)
## End(Not run)
# Should result in adjusted alpha 0.03389 (TIE 0.5000, TIE for nominal alpha 0.07189).
#
# As above but subject data simulations.
## Not run: 
##D scABEL.ad(CV = 0.3, sdsims = TRUE)
## End(Not run)
# Should result in adjusted alpha 0.03336 (TIE 0.5000, TIE for nominal alpha 0.07237).
#
# TRT|RTR, heteroscedasticity, sample size 48 (unbalanced), subject data simulations.
## Not run: 
##D scABEL.ad(CV = c(0.25, 0.3), design = "2x2x3", n = c(23, 25), sdsims = TRUE)
## End(Not run)
# Should result in adjusted alpha 0.02465 (TIE 0.5000, TIE for nominal alpha 0.09050).
#
# TRTR|RTRT, CV 0.35, sample size 33 (unbalanced).
## Not run: 
##D scABEL.ad(CV = 0.35, design = "2x2x4", n = c(16, 17))
## End(Not run)
# Should result in adjusted alpha 0.03632 (TIE 0.5000, TIE for nominal alpha 0.06544).



