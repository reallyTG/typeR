library(VFP)


### Name: predict.VFP
### Title: Predict Method for Objects of Class 'VFP'.
### Aliases: predict.VFP

### ** Examples

## No test: 
library(VCA)
data(VCAdata1)
lst <- anovaVCA(y~(device+lot)/day/run, VCAdata1, by="sample")
mat <- getMat.VCA(lst)		# automatically selects "total"
res <- fit.vfp(model.no=1:10, Data=mat)
predict(res)
predict(res, dispersion=0.95)
## End(No test)



