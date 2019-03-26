library(qtl)


### Name: top.errorlod
### Title: List genotypes with large error LOD scores
### Aliases: top.errorlod
### Keywords: print

### ** Examples

data(hyper)
## Don't show: 
hyper <- subset(hyper, chr=c(1,19))
## End(Don't show)
# Calculate error LOD scores
hyper <- calc.errorlod(hyper,error.prob=0.01)

# Print those above a specified cutoff 
top.errorlod(hyper,cutoff=4)



