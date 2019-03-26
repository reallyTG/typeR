library(nsgp)


### Name: plot.gppack
### Title: Plots several GP's simultaneously
### Aliases: plot.gppack

### ** Examples

# read toy data
data(toydata)

## Not run: 
##D can take several minutes
##D # perform two-sample regression
##D res = gpr2sample(toydata$ctrl$x, toydata$ctrl$y, toydata$case$x, toydata$case$y, seq(0,22,0.1))
##D 
##D # pre-computed model for toydata
##D data(toygps)
##D res = toygps
##D 
##D # basic plot
##D plot(res)
##D 
##D # plot also the null model, don't plot data, means or noise
##D plot(res, plotnull=TRUE, plotdata=FALSE, plotmeans=FALSE, plotnoise=FALSE)
## End(Not run)



