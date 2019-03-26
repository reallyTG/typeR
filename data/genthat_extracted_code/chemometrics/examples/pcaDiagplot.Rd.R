library(chemometrics)


### Name: pcaDiagplot
### Title: Diagnostics plot for PCA
### Aliases: pcaDiagplot
### Keywords: multivariate robust

### ** Examples

data(glass)
require(robustbase)
glass.mcd <- covMcd(glass)
rpca <- princomp(glass,covmat=glass.mcd)
res <- pcaDiagplot(glass,rpca,a=2)



