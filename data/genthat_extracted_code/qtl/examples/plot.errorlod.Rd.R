library(qtl)


### Name: plotErrorlod
### Title: Plot grid of error LOD values
### Aliases: plotErrorlod
### Keywords: hplot

### ** Examples

data(hyper)
## Don't show: 
hyper <- subset(hyper,chr=c(1,19))
## End(Don't show)
# Calculate error LOD scores
hyper <- calc.errorlod(hyper,error.prob=0.01)

# plot the error LOD scores; print those above a specified cutoff
plotErrorlod(hyper)
plotErrorlod(hyper,chr=1)



