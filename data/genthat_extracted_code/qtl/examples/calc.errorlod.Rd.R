library(qtl)


### Name: calc.errorlod
### Title: Identify likely genotyping errors
### Aliases: calc.errorlod
### Keywords: utilities

### ** Examples

data(hyper)
## Don't show: 
hyper <- subset(hyper,chr=c(1,19))
## End(Don't show)
hyper <- calc.errorlod(hyper,error.prob=0.01)

# print those above a specified cutoff 
top.errorlod(hyper, cutoff=4)

# plot genotype data, flagging genotypes with error LOD > cutoff
plotGeno(hyper, chr=1, ind=160:200, cutoff=7, min.sep=2)



