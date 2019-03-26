library(VFP)


### Name: coef.VFP
### Title: Extract Model-Coefficients from VFP-Objects.
### Aliases: coef.VFP

### ** Examples

## No test: 
library(VCA)
data(VCAdata1)
lst <- anovaVCA(y~(device+lot)/day/run, VCAdata1, by="sample")
mat <- getMat.VCA(lst)		# automatically selects "total"
res <- fit.vfp(model.no=1:10, Data=mat)
coef(res)
## End(No test)



