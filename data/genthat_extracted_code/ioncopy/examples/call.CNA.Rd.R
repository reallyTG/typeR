library(ioncopy)


### Name: call.CNA
### Title: Gene-wise or amplicon-wise calling of copy number alterations
### Aliases: call.CNA

### ** Examples

## Not run: 
##D data(coverage)
##D CN <- calculate.CN(coverage)
##D CNA <- assess(CN)
##D calls <- call.CNA(CNA)
## End(Not run)
## Don't show: 
data(coverage)
CN <- assess.CNA(coverage)
CNA <- call.CNA(CN, analysis.mode = "amplicon-wise", method.p = "samples", method.mt = "BH", thres.p = 0.05, sig.call= 1, sig.per=50)
## End(Don't show)



