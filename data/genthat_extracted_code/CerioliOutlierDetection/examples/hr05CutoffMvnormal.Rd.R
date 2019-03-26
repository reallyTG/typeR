library(CerioliOutlierDetection)


### Name: hr05CutoffMvnormal
### Title: Corrected Critical Values for Testing MCD-based Mahalanobis
###   Distances
### Aliases: hr05CutoffMvnormal
### Keywords: robust multivariate

### ** Examples

# examples from page 941 of Hardin and Rocke
hr05CutoffMvnormal(n.obs=50  , p.dim=5 , signif.alpha=0.05)
hr05CutoffMvnormal(n.obs=100 , p.dim=10, signif.alpha=0.05)
hr05CutoffMvnormal(n.obs=500 , p.dim=10, signif.alpha=0.05)
hr05CutoffMvnormal(n.obs=1000, p.dim=20, signif.alpha=0.05)



