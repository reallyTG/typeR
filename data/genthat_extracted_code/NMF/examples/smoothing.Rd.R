library(NMF)


### Name: smoothing
### Title: Smoothing Matrix in Nonsmooth NMF Models
### Aliases: smoothing

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

x <- nmfModel(3, model='NMFns')
smoothing(x)
smoothing(x, 0.1)



